data modify storage practice:gui settings_view set value []
data modify storage practice:gui settings_view append from storage practice:gui pages[1].entries[{tag:{index:9b}}]
execute if data storage practice:gui settings_view[{tag:{index:9b}}] run data modify storage practice:gui settings_view[{tag:{index:9b}}].Slot set value 10b
data modify storage practice:gui settings_view append from storage practice:gui pages[1].entries[{tag:{index:10b}}]
execute if data storage practice:gui settings_view[{tag:{index:10b}}] run data modify storage practice:gui settings_view[{tag:{index:10b}}].Slot set value 11b
data modify storage practice:gui settings_view append from storage practice:gui pages[1].entries[{tag:{index:11b}}]
execute if data storage practice:gui settings_view[{tag:{index:11b}}] run data modify storage practice:gui settings_view[{tag:{index:11b}}].Slot set value 12b
data modify storage practice:gui settings_view append from storage practice:gui pages[1].entries[{tag:{index:2b}}]
execute if data storage practice:gui settings_view[{tag:{index:2b}}] run data modify storage practice:gui settings_view[{tag:{index:2b}}].Slot set value 13b
data modify storage practice:gui settings_view append from storage practice:gui pages[1].entries[{tag:{index:5b}}]
execute if data storage practice:gui settings_view[{tag:{index:5b}}] run data modify storage practice:gui settings_view[{tag:{index:5b}}].Slot set value 14b
data modify storage practice:gui settings_view append value {Slot:9b,id:"minecraft:arrow",Count:1b,tag:{index:24b,display:{Name:'{"text":"Run Settings","color":"light_purple","italic":false}',Lore:['{"text":"player and world setup","color":"gray","italic":false}']}}}
data modify storage practice:gui settings_view append from storage practice:gui pages[1].entries[{tag:{index:17b}}]
execute if data storage practice:gui settings_view[{tag:{index:17b}}] run data modify storage practice:gui settings_view[{tag:{index:17b}}].Slot set value 15b
data modify storage practice:gui settings_view append from storage practice:gui pages[1].entries[{tag:{index:12b}}]
execute if data storage practice:gui settings_view[{tag:{index:12b}}] run data modify storage practice:gui settings_view[{tag:{index:12b}}].Slot set value 16b
data modify storage practice:gui settings_view append from storage practice:gui pages[1].entries[{tag:{index:21b}}]
execute if data storage practice:gui settings_view[{tag:{index:21b}}] run data modify storage practice:gui settings_view[{tag:{index:21b}}].Slot set value 17b
