import json
import pandas as pd
pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)

data = json.load(open('data.json'))

nodes = pd.DataFrame.from_dict(data['nodes'], orient='index')

nod = nodes.columns
nodes = nodes[nodes['isJewelSocket'] != True]
jewels = nodes[nodes['isJewelSocket'] == True]
nodes = nodes[nodes['isAscendancyStart'] != True]
nodes = nodes[nodes['isBlighted']!=True]
#blighted = nodes[nodes['isBlighted']==True]
nodes = nodes[nodes['isMastery']!=True]
mastery = nodes[nodes['isMastery']==True]
nodes = nodes[nodes['ascendancyName'].isna()]

nodes = nodes[['group','orbit','orbitIndex','out','in','skill','name']]
nodes = nodes.reset_index().rename(columns={'index':'id'})
groups = pd.DataFrame.from_dict(data['groups'], orient='index').reset_index().rename(columns={'index':'group'})
groups['group'] = groups['group'].astype(float)
nodes = nodes.merge(groups, on='group',how='left')

#nodes.groupby(['group']).count()

nodes['connect'] = nodes['out'] + nodes['in']
position = nodes[['id','x','y','orbit','orbitIndex']]
nodes = nodes.explode('connect')
#in é o que entra out é oq saí

nodes = nodes.drop(['out','in'], axis=1)
nodes = nodes[~nodes['connect'].isna()]