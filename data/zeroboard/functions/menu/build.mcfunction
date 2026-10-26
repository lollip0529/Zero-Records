setblock 139 65 0 minecraft:chest[facing=west,type=single,waterlogged=false] replace
data merge block 139 65 0 {CustomName:'{"color":"dark_purple","text":"Zero Cycle Filters"}'}
replaceitem block 139 65 0 container.9 minecraft:nether_star{zeroboard_menu:1b,zeroboard_selector:0b,display:{Name:'{"text":"Reset Filters","color":"gold","italic":false}',Lore:['{"text":"Show every recorded zero cycle","color":"gray","italic":false}']}} 1
replaceitem block 139 65 0 container.17 minecraft:nether_star{zeroboard_menu:1b,zeroboard_selector:11b,display:{Name:'{"text":"Time: Death Time","color":"gold","italic":false}',Lore:['{"text":"Death Time ↔ Finishing Time","color":"gray","italic":false}','{"text":"Prediction is replaced when","color":"dark_gray","italic":false}','{"text":"the finish is observed","color":"dark_gray","italic":false}']}} 1
replaceitem block 139 65 0 container.4 minecraft:ender_pearl{zeroboard_menu:1b,zeroboard_selector:9b,display:{Name:'{"text":"Location: Any","color":"blue","italic":false}',Lore:['{"text":"Any → Front → Back","color":"gray","italic":false}','{"text":"Front 1/8 → Back 1/8","color":"gray","italic":false}']}} 1
replaceitem block 139 65 0 container.11 minecraft:armor_stand{zeroboard_menu:1b,zeroboard_selector:1b,display:{Name:'{"text":"Standing: Any","color":"aqua","italic":false}',Lore:['{"text":"Any → 78–111","color":"gray","italic":false}']}} 1
replaceitem block 139 65 0 container.12 minecraft:tnt{zeroboard_menu:1b,zeroboard_selector:2b,display:{Name:'{"text":"Explosives: Any + Any","color":"light_purple","italic":false}',Lore:['{"text":"Left: base Any → 1–10","color":"gray","italic":false}','{"text":"Right: plus Any → None → 1–10","color":"gray","italic":false}']}} 2
replaceitem block 139 65 0 container.13 minecraft:end_stone{zeroboard_menu:1b,zeroboard_selector:5b,display:{Name:'{"text":"Spawn: All","color":"green","italic":false}',Lore:['{"text":"All Buried →","color":"gray","italic":false}','{"text":"All Overhang + Buried →","color":"gray","italic":false}','{"text":"All → Open","color":"gray","italic":false}','{"text":"O52 through O66","color":"dark_gray","italic":false}']}} 1
replaceitem block 139 65 0 container.14 minecraft:obsidian{zeroboard_menu:1b,zeroboard_selector:4b,display:{Name:'{"text":"Tower: Any","color":"dark_aqua","italic":false}',Lore:['{"text":"Cycle in Settings tower order","color":"gray","italic":false}']}} 1
replaceitem block 139 65 0 container.15 minecraft:diamond_pickaxe{zeroboard_menu:1b,zeroboard_selector:6b,HideFlags:3,Unbreakable:1b,display:{Name:'{"text":"Pickaxe: Any","color":"yellow","italic":false}',Lore:['{"text":"Priority (first match wins):","color":"gray","italic":false}','{"text":"Gold → Netherite → Diamond","color":"yellow","italic":false}','{"text":"Iron → Stone → Wood → Fist","color":"yellow","italic":false}','{"text":"Fist: buried + no pickaxe only","color":"dark_gray","italic":false}']}} 1
replaceitem block 139 65 0 container.22 minecraft:compass{zeroboard_menu:1b,zeroboard_selector:10b,display:{Name:'{"text":"Rotation: Any","color":"red","italic":false}',Lore:['{"text":"Any → CW → CCW","color":"gray","italic":false}']}} 1
replaceitem block 139 65 0 container.23 minecraft:flower_banner_pattern{zeroboard_menu:1b,zeroboard_selector:12b,display:{Name:'{"text":"Unique Zeros: Off","color":"dark_aqua","italic":false}',Lore:['{"text":"Show only the fastest","color":"gray","italic":false}','{"text":"matching setup","color":"gray","italic":false}','{"text":"Tower + standing + spawn","color":"dark_gray","italic":false}','{"text":"location + rotation + pickaxe","color":"dark_gray","italic":false}']}} 1
replaceitem block 139 65 0 container.26 minecraft:lava_bucket{zeroboard_menu:1b,zeroboard_selector:13b,display:{Name:'{"text":"Clear Records","color":"red","italic":false}',Lore:['{"text":"Click twice within 5 seconds","color":"gray","italic":false}','{"text":"to clear all records","color":"gray","italic":false}']}} 1
execute if score #clear_armed zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:13b}}].tag.display.Name set value '{"text":"Confirm Clear Records","color":"dark_red","bold":true,"italic":false}'
execute if score #clear_armed zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:13b}}].tag.display.Lore set value ['{"text":"Click again now to permanently","color":"red","italic":false}','{"text":"clear the archive","color":"red","italic":false}']
setblock 139 66 0 minecraft:air replace
kill @e[tag=zc_filter_label]
summon minecraft:armor_stand 139.5 65.90 0.5 {Invisible:1b,Marker:1b,NoGravity:1b,Invulnerable:1b,CustomNameVisible:1b,Tags:["zc_filter_label"],CustomName:'{"text":"Filters","color":"white"}'}

scoreboard players operation ZFHeight zc_ctrl = #filter_height zc_ctrl
scoreboard players operation ZFBase zc_ctrl = #filter_base zc_ctrl
scoreboard players operation ZFPlus zc_ctrl = #filter_plus zc_ctrl
scoreboard players operation ZFTower zc_ctrl = #filter_tower zc_ctrl
scoreboard players operation ZFSpawnHeight zc_ctrl = #filter_spawn zc_ctrl
scoreboard players add ZFSpawnHeight zc_ctrl 48

data modify block 139 65 0 Items[{tag:{zeroboard_selector:1b}}].tag.display.Name set value '{"text":"Standing: Any","color":"aqua","italic":false}'
execute unless score #filter_height zc_ctrl matches -1 as @e[tag=zc_title,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:menu/standing
execute unless score #filter_height zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:1b}}].tag.display.Name set from block 139 63 0 Items[{Slot:0b}].tag.display.Name
data modify block 139 65 0 Items[{tag:{zeroboard_selector:1b}}].tag.display.Lore set value ['{"text":"Any → 78–111","color":"gray","italic":false}']
execute if score #filter_height zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:1b}}].tag.display.Lore[0] set value '[{"text":"Any","color":"aqua","italic":false},{"text":" → 78–111","color":"gray","italic":false}]'
execute unless score #filter_height zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:1b}}].tag.display.Lore[0] set value '[{"text":"Any → ","color":"gray","italic":false},{"text":"78–111","color":"aqua","italic":false}]'

data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Name set value '{"text":"Explosives: Any + Any","color":"light_purple","italic":false}'
execute if score #filter_base zc_ctrl matches 1..10 if score #filter_plus zc_ctrl matches 1..10 as @e[tag=zc_title,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:menu/explosives
execute if score #filter_base zc_ctrl matches 1..10 if score #filter_plus zc_ctrl matches 1..10 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Name set from block 139 63 0 Items[{Slot:0b}].tag.display.Name
execute unless score #filter_base zc_ctrl matches -1 if score #filter_plus zc_ctrl matches -1 as @e[tag=zc_title,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:menu/explosives_plus_any
execute unless score #filter_base zc_ctrl matches -1 if score #filter_plus zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Name set from block 139 63 0 Items[{Slot:0b}].tag.display.Name
execute if score #filter_base zc_ctrl matches -1 if score #filter_plus zc_ctrl matches 1..10 as @e[tag=zc_title,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:menu/explosives_base_any
execute if score #filter_base zc_ctrl matches -1 if score #filter_plus zc_ctrl matches 1..10 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Name set from block 139 63 0 Items[{Slot:0b}].tag.display.Name
execute if score #filter_base zc_ctrl matches 1..10 if score #filter_plus zc_ctrl matches 0 as @e[tag=zc_title,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:menu/explosives_none
execute if score #filter_base zc_ctrl matches 1..10 if score #filter_plus zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Name set from block 139 63 0 Items[{Slot:0b}].tag.display.Name
execute if score #filter_base zc_ctrl matches -1 if score #filter_plus zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Name set value '{"text":"Explosives: Any","color":"light_purple","italic":false}'
scoreboard players set #menu_tnt_expected zc_ctrl 0
execute if score #filter_base zc_ctrl matches 1..10 run scoreboard players operation #menu_tnt_expected zc_ctrl = #filter_base zc_ctrl
execute if score #filter_plus zc_ctrl matches 1..10 run scoreboard players operation #menu_tnt_expected zc_ctrl += #filter_plus zc_ctrl
execute if score #menu_tnt_expected zc_ctrl matches ..1 run scoreboard players set #menu_tnt_expected zc_ctrl 2
execute store result block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].Count byte 1 run scoreboard players get #menu_tnt_expected zc_ctrl
data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Lore set value ['{"text":"Left: base Any → 1–10","color":"gray","italic":false}','{"text":"Right: plus Any → None → 1–10","color":"gray","italic":false}']
execute if score #filter_base zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Lore[0] set value '[{"text":"Left: base ","color":"gray","italic":false},{"text":"Any","color":"light_purple","italic":false},{"text":" → 1–10","color":"gray","italic":false}]'
execute if score #filter_base zc_ctrl matches 1..10 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Lore[0] set value '[{"text":"Left: base Any → ","color":"gray","italic":false},{"text":"1–10","color":"light_purple","italic":false}]'
execute if score #filter_plus zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Lore[1] set value '[{"text":"Right: plus ","color":"gray","italic":false},{"text":"Any","color":"light_purple","italic":false},{"text":" → None → 1–10","color":"gray","italic":false}]'
execute if score #filter_plus zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Lore[1] set value '[{"text":"Right: plus Any → ","color":"gray","italic":false},{"text":"None","color":"light_purple","italic":false},{"text":" → 1–10","color":"gray","italic":false}]'
execute if score #filter_plus zc_ctrl matches 1..10 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:2b}}].tag.display.Lore[1] set value '[{"text":"Right: plus Any → None → ","color":"gray","italic":false},{"text":"1–10","color":"light_purple","italic":false}]'

data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Name set value '{"text":"Location: Any","color":"blue","italic":false}'
execute if score #filter_location zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Name set value '{"text":"Location: Front","color":"blue","italic":false}'
execute if score #filter_location zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Name set value '{"text":"Location: Back","color":"blue","italic":false}'
execute if score #filter_location zc_ctrl matches 2 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Name set value '{"text":"Location: Front 1/8","color":"blue","italic":false}'
execute if score #filter_location zc_ctrl matches 3 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Name set value '{"text":"Location: Back 1/8","color":"blue","italic":false}'
data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Lore set value ['{"text":"Any → Front → Back","color":"gray","italic":false}','{"text":"Front 1/8 → Back 1/8","color":"gray","italic":false}']
execute if score #filter_location zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Lore[0] set value '[{"text":"Any","color":"blue","italic":false},{"text":" → Front → Back","color":"gray","italic":false}]'
execute if score #filter_location zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Lore[0] set value '[{"text":"Any → ","color":"gray","italic":false},{"text":"Front","color":"blue","italic":false},{"text":" → Back","color":"gray","italic":false}]'
execute if score #filter_location zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Lore[0] set value '[{"text":"Any → Front → ","color":"gray","italic":false},{"text":"Back","color":"blue","italic":false}]'
execute if score #filter_location zc_ctrl matches 2 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Lore[1] set value '[{"text":"Front 1/8","color":"blue","italic":false},{"text":" → Back 1/8","color":"gray","italic":false}]'
execute if score #filter_location zc_ctrl matches 3 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:9b}}].tag.display.Lore[1] set value '[{"text":"Front 1/8 → ","color":"gray","italic":false},{"text":"Back 1/8","color":"blue","italic":false}]'

data modify block 139 65 0 Items[{tag:{zeroboard_selector:4b}}].tag.display.Name set value '{"text":"Tower: Any","color":"dark_aqua","italic":false}'
data modify storage zeroboard:records work.filter_tower set value "Unknown"
execute if score #filter_tower zc_ctrl matches 76 run data modify storage zeroboard:records work.filter_tower set value "Small Boy (76)"
execute if score #filter_tower zc_ctrl matches 79 run data modify storage zeroboard:records work.filter_tower set value "Small Cage (79)"
execute if score #filter_tower zc_ctrl matches 82 run data modify storage zeroboard:records work.filter_tower set value "Tall Cage (82)"
execute if score #filter_tower zc_ctrl matches 85 run data modify storage zeroboard:records work.filter_tower set value "M-85"
execute if score #filter_tower zc_ctrl matches 88 run data modify storage zeroboard:records work.filter_tower set value "M-88"
execute if score #filter_tower zc_ctrl matches 91 run data modify storage zeroboard:records work.filter_tower set value "M-91"
execute if score #filter_tower zc_ctrl matches 94 run data modify storage zeroboard:records work.filter_tower set value "T-94"
execute if score #filter_tower zc_ctrl matches 97 run data modify storage zeroboard:records work.filter_tower set value "T-97"
execute if score #filter_tower zc_ctrl matches 100 run data modify storage zeroboard:records work.filter_tower set value "T-100"
execute if score #filter_tower zc_ctrl matches 103 run data modify storage zeroboard:records work.filter_tower set value "Tall Boy (103)"
execute unless score #filter_tower zc_ctrl matches -1 as @e[tag=zc_title,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:menu/tower
execute unless score #filter_tower zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:4b}}].tag.display.Name set from block 139 63 0 Items[{Slot:0b}].tag.display.Name

execute if score #filter_spawn zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Name set value '{"text":"Spawn: All Buried","color":"green","italic":false}'
execute if score #filter_spawn zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Name set value '{"text":"Spawn: All Overhang + Buried","color":"green","italic":false}'
execute if score #filter_spawn zc_ctrl matches 2 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Name set value '{"text":"Spawn: All","color":"green","italic":false}'
execute if score #filter_spawn zc_ctrl matches 3 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Name set value '{"text":"Spawn: Open","color":"green","italic":false}'
execute if score #filter_spawn zc_ctrl matches 4..18 as @e[tag=zc_title,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:menu/spawn
execute if score #filter_spawn zc_ctrl matches 4..18 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Name set from block 139 63 0 Items[{Slot:0b}].tag.display.Name
data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Lore set value ['{"text":"All Buried →","color":"gray","italic":false}','{"text":"All Overhang + Buried →","color":"gray","italic":false}','{"text":"All → Open","color":"gray","italic":false}','{"text":"O52 through O66","color":"dark_gray","italic":false}']
execute if score #filter_spawn zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Lore[0] set value '[{"text":"All Buried","color":"green","italic":false},{"text":" →","color":"gray","italic":false}]'
execute if score #filter_spawn zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Lore[1] set value '[{"text":"All Overhang + Buried","color":"green","italic":false},{"text":" →","color":"gray","italic":false}]'
execute if score #filter_spawn zc_ctrl matches 2 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Lore[2] set value '[{"text":"All","color":"green","italic":false},{"text":" → Open","color":"gray","italic":false}]'
execute if score #filter_spawn zc_ctrl matches 3 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Lore[2] set value '[{"text":"All → ","color":"gray","italic":false},{"text":"Open","color":"green","italic":false}]'
execute if score #filter_spawn zc_ctrl matches 4..18 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:5b}}].tag.display.Lore[3] set value '{"text":"O52 through O66","color":"green","italic":false}'

data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].id set value "minecraft:diamond_pickaxe"
data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Name set value '{"text":"Pickaxe: Any","color":"yellow","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches 5 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].id set value "minecraft:golden_pickaxe"
execute if score #filter_pickaxe zc_ctrl matches 5 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Name set value '{"text":"Pickaxe: Gold","color":"gold","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches 4 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].id set value "minecraft:netherite_pickaxe"
execute if score #filter_pickaxe zc_ctrl matches 4 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Name set value '{"text":"Pickaxe: Netherite","color":"dark_purple","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches 3 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Name set value '{"text":"Pickaxe: Diamond","color":"aqua","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches 2 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].id set value "minecraft:iron_pickaxe"
execute if score #filter_pickaxe zc_ctrl matches 2 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Name set value '{"text":"Pickaxe: Iron","color":"white","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].id set value "minecraft:stone_pickaxe"
execute if score #filter_pickaxe zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Name set value '{"text":"Pickaxe: Stone","color":"gray","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches 6 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].id set value "minecraft:wooden_pickaxe"
execute if score #filter_pickaxe zc_ctrl matches 6 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Name set value '{"text":"Pickaxe: Wood","color":"#8B4513","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].id set value "minecraft:barrier"
execute if score #filter_pickaxe zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Name set value '{"text":"Pickaxe: Fist (Buried)","color":"white","italic":false}'
data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore set value ['{"text":"Priority (first match wins):","color":"gray","italic":false}','{"text":"Gold → Netherite → Diamond","color":"gray","italic":false}','{"text":"Iron → Stone → Wood → Fist","color":"gray","italic":false}','{"text":"Fist: buried + no pickaxe only","color":"dark_gray","italic":false}']
execute if score #filter_pickaxe zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[1] set value '{"text":"Gold → Netherite → Diamond","color":"yellow","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[2] set value '{"text":"Iron → Stone → Wood → Fist","color":"yellow","italic":false}'
execute if score #filter_pickaxe zc_ctrl matches 5 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[1] set value '[{"text":"Gold","color":"gold","italic":false},{"text":" → Netherite → Diamond","color":"gray","italic":false}]'
execute if score #filter_pickaxe zc_ctrl matches 4 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[1] set value '[{"text":"Gold → ","color":"gray","italic":false},{"text":"Netherite","color":"dark_purple","italic":false},{"text":" → Diamond","color":"gray","italic":false}]'
execute if score #filter_pickaxe zc_ctrl matches 3 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[1] set value '[{"text":"Gold → Netherite → ","color":"gray","italic":false},{"text":"Diamond","color":"aqua","italic":false}]'
execute if score #filter_pickaxe zc_ctrl matches 2 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[2] set value '[{"text":"Iron","color":"white","italic":false},{"text":" → Stone → Wood → Fist","color":"gray","italic":false}]'
execute if score #filter_pickaxe zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[2] set value '[{"text":"Iron → ","color":"gray","italic":false},{"text":"Stone","color":"dark_gray","italic":false},{"text":" → Wood → Fist","color":"gray","italic":false}]'
execute if score #filter_pickaxe zc_ctrl matches 6 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[2] set value '[{"text":"Iron → Stone → ","color":"gray","italic":false},{"text":"Wood","color":"#8B4513","italic":false},{"text":" → Fist","color":"gray","italic":false}]'
execute if score #filter_pickaxe zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:6b}}].tag.display.Lore[2] set value '[{"text":"Iron → Stone → Wood → ","color":"gray","italic":false},{"text":"Fist","color":"white","italic":false}]'

data modify block 139 65 0 Items[{tag:{zeroboard_selector:10b}}].tag.display.Name set value '{"text":"Rotation: Any","color":"red","italic":false}'
execute if score #filter_rotation zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:10b}}].tag.display.Name set value '{"text":"Rotation: CW","color":"red","italic":false}'
execute if score #filter_rotation zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:10b}}].tag.display.Name set value '{"text":"Rotation: CCW","color":"red","italic":false}'
data modify block 139 65 0 Items[{tag:{zeroboard_selector:11b}}].tag.display.Name set value '{"text":"Time: Death Time","color":"gold","italic":false}'
execute if score #time_mode zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:11b}}].tag.display.Name set value '{"text":"Time: Finishing Time","color":"gold","italic":false}'
data modify block 139 65 0 Items[{tag:{zeroboard_selector:12b}}].tag.display.Name set value '{"text":"Unique Zeros: Off","color":"dark_aqua","italic":false}'
execute if score #unique_mode zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:12b}}].tag.display.Name set value '{"text":"Unique Zeros: On","color":"green","italic":false}'
data modify block 139 65 0 Items[{tag:{zeroboard_selector:10b}}].tag.display.Lore set value ['{"text":"Any → CW → CCW","color":"gray","italic":false}']
execute if score #filter_rotation zc_ctrl matches -1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:10b}}].tag.display.Lore[0] set value '[{"text":"Any","color":"red","italic":false},{"text":" → CW → CCW","color":"gray","italic":false}]'
execute if score #filter_rotation zc_ctrl matches 0 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:10b}}].tag.display.Lore[0] set value '[{"text":"Any → ","color":"gray","italic":false},{"text":"CW","color":"red","italic":false},{"text":" → CCW","color":"gray","italic":false}]'
execute if score #filter_rotation zc_ctrl matches 1 run data modify block 139 65 0 Items[{tag:{zeroboard_selector:10b}}].tag.display.Lore[0] set value '[{"text":"Any → CW → ","color":"gray","italic":false},{"text":"CCW","color":"red","italic":false}]'
