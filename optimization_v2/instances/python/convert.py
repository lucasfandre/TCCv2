import json
import pandas as pd
import math
import networkx as nx

def makesin(x):
    return math.sin(x)


pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)

data = json.load(open('data.json'))

nodes = pd.DataFrame.from_dict(data['nodes'], orient='index')

nod = nodes.columns
jewels = nodes[nodes['isJewelSocket'] == True]
nodes = nodes[nodes['isJewelSocket'] != True]
nodes = nodes[nodes['isAscendancyStart'] != True]
nodes = nodes[nodes['isBlighted']!=True]
#blighted = nodes[nodes['isBlighted']==True]]
mastery = nodes[nodes['isMastery']==True]
nodes = nodes[nodes['isMastery']!=True]
nodes = nodes[nodes['ascendancyName'].isna()]

nodes = nodes[['group','orbit','orbitIndex','out','in','skill','name']]
nodes = nodes.reset_index().rename(columns={'index':'id'})
groups = pd.DataFrame.from_dict(data['groups'], orient='index').reset_index().rename(columns={'index':'group'})
groups['group'] = groups['group'].astype(float)
nodes = nodes.merge(groups, on='group',how='left')

#nodes.groupby(['group']).count()

nodes['connect'] = nodes['out'] + nodes['in']
#nodes = nodes[~nodes['x'].isna()]
position = nodes[['id','x','y','orbit','orbitIndex','connect']]
position = position[~position['connect'].isna()]

nodes = nodes.explode('connect')

nodes = nodes[~nodes['connect'].isna()]


#in é o que entra out é oq saí

nodes = nodes.drop(['out','in'], axis=1)

nodes = nodes[['id','connect']]
jewels = jewels.reset_index().rename(columns={'index':'id'})[['id','name']]
mastery = mastery.reset_index().rename(columns={'index':'id'})[['id','name']]
nodes = nodes[~nodes['connect'].isin(jewels['id'])]
nodes = nodes[~nodes['connect'].isin(mastery['id'])]


position['x'] = position['x'] + position['orbit']+ position['orbitIndex']*2
position['y'] = position['y'] + position['orbit'] + position['orbitIndex']*2
position = position.drop(['orbit','orbitIndex','connect'],axis=1)
position.to_excel('position.xlsx')

nodes.loc[nodes['id']=='root','id'] = '0'
nodes.loc[nodes['connect']=='root','id'] = '0'

df = pd.crosstab(nodes['id'], nodes['connect'])
idx = df.columns.union(df.index)
df = df.reindex(index = idx,columns=idx, fill_value=0)

G = nx.from_pandas_adjacency(df)

df = nx.to_pandas_edgelist(G)

df.to_excel('edgelist.xlsx')