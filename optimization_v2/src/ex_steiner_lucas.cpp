//----------------------------------------------------------------------
// Branch and Cut algorithm for the Minimum Cost Steiner Tree
//
// Formulation using directed graphs
//
// It is interesting to compare the performance of the formulation used
// in ex_steiner_directed.cpp (faster) with the one used 
// in ex_steiner_undirected.cpp (slower)
//
// Chopra and Rao [CR94] show that the optimal value of the LP relaxation of
// the directed model in ex_steiner_directed.cpp is greater or equal to the
// corresponding value of the undirected formulation in ex_steiner_undirected.cpp
//
// [CR94] Chopra, S. and Rao, M. R. (1994a). The Steiner tree problem
// I: Formulations, compo- sitions and extension of facets.
// Mathematical Programming, 64(2):209-229.
//
// An interesting paper using the directed formulation, using several techniques
// (such as preprocess the input graph to remove edges/nodes, use of better
// inequalities,etc) is given in the following paper:
// 
// [KM98] T. Koch  A. Martin. Solving Steiner tree problems in graphs to optimality.
// Networks, 32: 207-232, 1998.
//
// A more sofisticated code can be seen in the paper
//
// [GKMRS17] G. Gamrath, T. Koch, S.J. Maher, D. Rehfeldt,
// Y. Shinano. SCIP-Jack-a solver for STP and variants with
// parallelization extensions.  Math. Prog. Comp. (2017) 9:231-296.
//
// Send comments/corrections to Flavio K. Miyazawa.
//----------------------------------------------------------------------
#include <gurobi_c++.h>
#include <float.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <lemon/list_graph.h>
#include "mygraphlib.h"
#include <string>
#include "myutils.h"
#include "solver.h"
#include <lemon/concepts/digraph.h>
#include <lemon/preflow.h>
#if __cplusplus >= 201103L
#include <unordered_map>
#else
#include <tr1/unordered_map>
#endif
using namespace lemon;
using namespace std;

int cutcount = 0;
// adaptar do e-mail enviado pelo professor
// Steiner_Instance put all relevant information in one class.
class Steiner_Instance {
public:
  Steiner_Instance(Digraph &graph,
		   DNodeStringMap &vvname, 
		   DNodePosMap &posx,
		   DNodePosMap &posy,
		   ArcValueMap &eweight,
       NodeValueMap &nprize,  // prize of each node
		   vector <DNode> &V); // first nt nodes are terminals
  Digraph &g;
  DNodeStringMap &vname;
  DNodePosMap &px;
  DNodePosMap &py;
  ArcValueMap &weight;
  NodeValueMap &prize;
  int nt,nnodes;
  vector <DNode> &V; // Node V[0] is the root. Nodes V[1], ... , V[nt-1] are the destination
};

Steiner_Instance::Steiner_Instance(Digraph &graph,DNodeStringMap &vvname,
	DNodePosMap &posx,DNodePosMap &posy,ArcValueMap &eweight,NodeValueMap &nprize,vector <DNode> &V):
        g(graph), vname(vvname), px(posx), py(posy), weight(eweight),prize(nprize), V(V) {
  nnodes = countNodes(g);
  nt = V.size();
}

bool ReadSteinerDigraph(string filename,Digraph &dg,DNodeStringMap& vname,
	DNodePosMap& posx,DNodePosMap& posy,ArcValueMap& weight,NodeValueMap& prize,vector <DNode> &V){
  // Although we use a digraph, the input file is given as a graph.
  // So, we read a graph and then convert to a digraph.
  // talvez possa tb implementar a adição de arestas da raiz para todos os outros?
  string type = GetGraphFileType(filename);
  if (type!="graph"){cout<<"Error: Unknown type of graph: "<<type<<endl;exit(1);}

  Graph g;
  GraphTable GT(filename,g); // Read the graph (only nodes and edges)
  NodeIntMap is_terminal(g);
  NodeStringMap vn(g);
  EdgeValueMap w(g);
  NodeValueMap prize(g);
  NodePosMap px(g);
  NodePosMap py(g);

  bool ok = GT.GetColumn("nodename",vn);
  ok = ok && GT.GetColumn("weight",w);
  ok = ok && GT.GetColumn("terminal",is_terminal);
  ok = ok && GT.GetColumn("prize",prize);
  ok = ok && GetNodeCoordinates(GT,"posx",px,"posy",py);

  // Construction of the digraph
  NodeDNodeMap nodemap(g); EdgeArcMap edgemap1(g); EdgeArcMap edgemap2(g);
  Graph2Digraph(g,dg,nodemap,edgemap1,edgemap2);
  for (NodeIt v(g);v!=INVALID;++v) {
    vname[nodemap[v]]=vn[v];
    posx[nodemap[v]]=px[v];  posy[nodemap[v]]=py[v];
    if (is_terminal[v]) V.push_back(nodemap[v]);}

  for (EdgeIt e(g);e!=INVALID;++e) {
    weight[edgemap1[e]] = w[e];
    weight[edgemap2[e]] = w[e];}
  return(ok);
}


int main(int argc, char *argv[]) 
{
  Digraph g;  // graph declaration
  string filename;
  DNodeStringMap vname(g);  // name of graph nodes
  DNodePosMap px(g),py(g);  // xy-coodinates for each node
  DNodeColorMap vcolor(g);// color of nodes
  ArcStringMap aname(g);  // name of graph nodes
  ArcColorMap acolor(g); // color of edges
  ArcValueMap lpvar(g);    // used to obtain the contents of the LP variables
  ArcValueMap weight(g);   // edge weights
  NodeValueMap prize(g);   // prize of each node
  Digraph::ArcMap<GRBVar> x(g); // binary variables for each arc
  Digraph::NodeMap<GRBVar> f(g); //flow for each node
  vector <DNode> V;
  int seed=0;
  srand48(1);

  // uncomment one of these lines to change default pdf reader, or insert new one
  //set_pdfreader("open");    // pdf reader for Mac OS X
  //set_pdfreader("xpdf");    // pdf reader for Linux
  //set_pdfreader("evince");  // pdf reader for Linux

  
  // double cutoff;   // used to prune non promissing branches (of the B&B tree)
  if (argc!=2) {cout<< endl << "Usage: "<< argv[0]<<"  <digraph_steiner_filename>"<< endl << endl;
    cout << "Example:" << endl <<
      "\t" << argv[0] << " "<< getpath(argv[0])+"../instances/k_berlin52_20.steiner" << endl <<
      "\t" << argv[0] << " "<< getpath(argv[0])+"../instances/k_att48_13.steiner" << endl;
    exit(0);}

  filename = argv[1];

  //int time_limit = 3600; // Solver stops after time_limit seconds
  GRBEnv env = GRBEnv();
  GRBModel model = GRBModel(env);
  model.getEnv().set(GRB_IntParam_LazyConstraints, 0); //sem lazy constraints
  model.getEnv().set(GRB_IntParam_Seed, seed);  // define random seed como 0, não gera resultados diferentes para cada iteração
  model.set(GRB_StringAttr_ModelName, "Steiner Tree prize collecting"); // prob. name
  model.set(GRB_IntAttr_ModelSense, GRB_MAXIMIZE); // is a minimization problem
  // mudar para GRB_MAXIMIZE?

  ReadSteinerDigraph(filename,g,vname,px,py,weight,prize,V);
  Steiner_Instance T(g,vname,px,py,weight,prize,V);
  
  // Generate the binary variables and the objective function
  // Add one binary variable for each edge and set its cost in the objective function
  for (ArcIt e(g); e != INVALID; ++e) {
    char name[100];
    sprintf(name,"X_%s_%s",vname[g.source(e)].c_str(),vname[g.target(e)].c_str());
    x[e] = model.addVar(0.0, 1.0, weight[e],GRB_BINARY,name); }
  model.update(); // run update to use model inserted variables
  try {
    //if (time_limit >= 0) model.getEnv().set(GRB_DoubleParam_TimeLimit,time_limit);
    //model.getEnv().set(GRB_DoubleParam_ImproveStartTime,10); //try better sol. aft. 10s
    // if (cutoff > 0) model.getEnv().set(GRB_DoubleParam_Cutoff, cutoff );
    //model.write("model.lp"); system("cat model.lp");
    model.optimize();
    if (model.get(GRB_IntAttr_SolCount) == 0)  // if could not obtain a solution
      throw "Could not obtain a solution.";

    ArcValueMap lpvar(g);    // used to obtain the contents of the LP variables
    GetSolverValue(g,lpvar,x); // lpvar <-- x
    DigraphAttributes G(g,vname,px,py);
    G.SetDefaultDNodeAttrib("color=Gray style=filled width=0.2 height=0.2 fixedsize=true");
    for (int i=0;i<T.nt;i++)G.SetColor(T.V[i],"Magenta");//color terminals with magenta
    G.SetColor(T.V[0],"Red"); // except the root, that is painted  Red
    G.SetColorByValue(1.0,lpvar,"Blue"); // All arcs with x[a]=1 are painted with Blue
    G.SetColorByValue(0.0,lpvar,"Invis"); // other arcs are invisible
    // somatório das arestar xE <= K --> numero máximo dado
    //Função objetivo: max somatório de Pj*xj tal que Pj é o premio dado por pegar o vértice
    //root tem o nome 0
    // somatório do que entra em um vertice E = 1
    // somatório do flow de saida de root = n (pois se coloca uma aresta artificial indo da raiz até todos os outros vértices) em que n é o número de vértices -1
    //somatório do flow de saida de E = Somatório de flow de entrada - 1 (o vértice consome um ponto de flow)
    //isso faz com que fE <= nxE (se passar algum fluxo em E, então xE é parte da solução e portanto é 1)
    //Somatório de entrada em Xe = 1 (pois tem que ter um vértice entrando nem que seja o vermelho)
    //n colocar arestas vermelhas entrando no terminal, pq?
    //xij (de i para j) <= 1 - Xri esse eu n entendi mesmo

    G.SetLabel("Steiner Tree cost in graph with "+IntToString(T.nnodes)+
	       " nodes and "+IntToString(T.nt)+" terminals: "+
	       DoubleToString(GetModelValue(model)));
    G.View();
  } catch (...) {cout << "Error: Could not solve the model." << endl; }
  return 0;
}

