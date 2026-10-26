execute if score index gui matches 0 run data modify storage practice:gui spawn_pool[{tag:{index:0b}}].active set value 1b
execute if score index gui matches 1 run data modify storage practice:gui spawn_pool[{tag:{index:1b}}].active set value 1b
execute if score index gui matches 2 run data modify storage practice:gui spawn_pool[{tag:{index:2b}}].active set value 1b
execute if score index gui matches 3 run data modify storage practice:gui spawn_pool[{tag:{index:3b}}].active set value 1b
execute if score index gui matches 4 run data modify storage practice:gui spawn_pool[{tag:{index:4b}}].active set value 1b
execute if score index gui matches 5 run data modify storage practice:gui spawn_pool[{tag:{index:5b}}].active set value 1b
execute if score index gui matches 6 run data modify storage practice:gui spawn_pool[{tag:{index:6b}}].active set value 1b
execute if score index gui matches 7 run data modify storage practice:gui spawn_pool[{tag:{index:7b}}].active set value 1b
execute if score index gui matches 8 run data modify storage practice:gui spawn_pool[{tag:{index:8b}}].active set value 1b
execute if score index gui matches 9 run data modify storage practice:gui spawn_pool[{tag:{index:9b}}].active set value 1b
execute if score index gui matches 10 run data modify storage practice:gui spawn_pool[{tag:{index:10b}}].active set value 1b
execute if score index gui matches 11 run data modify storage practice:gui spawn_pool[{tag:{index:11b}}].active set value 1b
execute if score index gui matches 12 run data modify storage practice:gui spawn_pool[{tag:{index:12b}}].active set value 1b
execute if score index gui matches 13 run data modify storage practice:gui spawn_pool[{tag:{index:13b}}].active set value 1b
execute if score index gui matches 14 run data modify storage practice:gui spawn_pool[{tag:{index:14b}}].active set value 1b
execute if score index gui matches 15 run data modify storage practice:gui spawn_pool[{tag:{index:15b}}].active set value 1b
execute if score index gui matches 16 run data modify storage practice:gui spawn_pool[{tag:{index:16b}}].active set value 1b

execute store result score enabled gui run data get storage practice:gui spawn_pool[{active:1b}].enabled

execute if score enabled gui matches 0 run data modify storage practice:gui spawn_pool[{active:1b}].enabled set value 1b
execute if score enabled gui matches 0 run data modify storage practice:gui spawn_pool[{active:1b}].tag.Enchantments set value [{}]
execute if score enabled gui matches 0 run data modify storage practice:gui spawn_pool[{active:1b}].tag.display.Lore set value ['{"text":"Enabled","color":"green","italic":"false"}']

execute if score enabled gui matches 1 run data modify storage practice:gui spawn_pool[{active:1b}].enabled set value 0b
execute if score enabled gui matches 1 run data remove storage practice:gui spawn_pool[{active:1b}].tag.Enchantments
execute if score enabled gui matches 1 run data modify storage practice:gui spawn_pool[{active:1b}].tag.display.Lore set value ['{"text":"Disabled","color":"red","italic":"false"}']

data remove storage practice:gui spawn_pool[].active
