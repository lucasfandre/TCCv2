import json
import pandas as pd
pd.set_option('display.max_columns', None)

data = json.load(open('data.json'))

nodes = pd.DataFrame.from_dict(data['nodes'], orient='index')


Index(['group', 'orbit', 'orbitIndex', 'out', 'in', 'skill', 'name', 'icon',
       'ascendancyName', 'stats', 'isNotable', 'reminderText',
       'isAscendancyStart', 'grantedStrength', 'grantedIntelligence',
       'isProxy', 'isJewelSocket', 'expansionJewel', 'isMultipleChoiceOption',
       'grantedPassivePoints', 'isMultipleChoice', 'isBlighted', 'recipe',
       'grantedDexterity', 'isMastery', 'inactiveIcon', 'activeIcon',
       'activeEffectImage', 'masteryEffects', 'isKeystone', 'flavourText',
       'classStartIndex'],

nodes = nodes[nodes['isJewelSocket'] != True]
nodes = nodes[nodes['isAscendancyStart'] != True]
nodes = nodes[nodes['isBlighted']!=True]
nodes = nodes[nodes['isMastery']!=True]
nodes = nodes[nodes['ascendancyName'].isna()]

nodes = nodes[['group','orbit','orbitIndex','out','in','skill','name']]