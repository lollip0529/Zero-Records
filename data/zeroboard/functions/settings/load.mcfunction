# preserve saved values while rebuilding added settings and extending base entries.

# the in-place edits need one entry per index, see practice:gui/dedupe
data modify storage practice:gui src set from storage practice:gui pages[1].entries
function practice:gui/dedupe
data modify storage practice:gui pages[1].entries set from storage practice:gui clean
data modify storage practice:gui src set from storage practice:gui pages[1].defaults
function practice:gui/dedupe
data modify storage practice:gui pages[1].defaults set from storage practice:gui clean

# apply migrations in order; each consumes the previous menu layout.
execute unless score #buried_v2 zc_ctrl matches 1 run function zeroboard:settings/migrate/spawn_v2
scoreboard players set #buried_v2 zc_ctrl 1
execute unless score #buried_v3 zc_ctrl matches 1 run function zeroboard:settings/migrate/spawn_v3
scoreboard players set #buried_v3 zc_ctrl 1
execute unless score #spawn_order_v4 zc_ctrl matches 1 run function zeroboard:settings/migrate/spawn_v4
scoreboard players set #spawn_order_v4 zc_ctrl 1
execute unless score #spawn_custom_v5 zc_ctrl matches 1 run function zeroboard:settings/migrate/spawn_v5
scoreboard players set #spawn_custom_v5 zc_ctrl 1

execute if data storage practice:gui pages[1].entries[{tag:{index:4b}}] if data storage practice:gui pages[1].defaults[{tag:{index:4b}}] run function zeroboard:settings/extend/spawn
execute if data storage practice:gui pages[1].entries[{tag:{index:3b}}] if data storage practice:gui pages[1].defaults[{tag:{index:3b}}] run function zeroboard:settings/extend/saturation
execute if data storage practice:gui pages[1].entries[{tag:{index:7b}}] if data storage practice:gui pages[1].defaults[{tag:{index:7b}}] run function zeroboard:settings/extend/rotation
execute if data storage practice:gui pages[1].entries[{tag:{index:8b}}] if data storage practice:gui pages[1].defaults[{tag:{index:8b}}] run function zeroboard:settings/extend/randomize

# MCSR and 1.2.1 base packs predate the 1.2.2 Fire Resistance (12) and Dragon (13)
# entries, so nothing ever sets their scores and play gates the dragon on matches 0
execute unless score fireres settings = fireres settings run scoreboard players set fireres settings 0
execute unless score disable_dragon settings = disable_dragon settings run scoreboard players set disable_dragon settings 0

# the base pack fills the top row's spare cells (slots 3-8) with panes. the pack's own
# controls go there instead, and index 18 (Death Skip) was retired
data remove storage practice:gui pages[1].entries[{Slot:3b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].entries[{Slot:4b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].entries[{Slot:5b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].entries[{Slot:6b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].entries[{Slot:7b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].entries[{Slot:8b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].defaults[{Slot:3b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].defaults[{Slot:4b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].defaults[{Slot:5b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].defaults[{Slot:6b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].defaults[{Slot:7b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].defaults[{Slot:8b,tag:{index:-1b}}]
data remove storage practice:gui pages[1].entries[{tag:{index:18b}}]
data remove storage practice:gui pages[1].defaults[{tag:{index:18b}}]
scoreboard players reset death_skip settings
scoreboard players reset #death_skip_entry zc_ctrl
scoreboard players reset #death_skip_default zc_ctrl

scoreboard players set #tmpl_value zc_ctrl -1
scoreboard players set #tmpl_default zc_ctrl -1
execute store result score #tmpl_value zc_ctrl run data get storage practice:gui pages[1].entries[{tag:{index:14b}}].value
execute store result score #tmpl_default zc_ctrl run data get storage practice:gui pages[1].defaults[{tag:{index:14b}}].value
data remove storage practice:gui pages[1].entries[{tag:{index:14b}}]
data remove storage practice:gui pages[1].defaults[{tag:{index:14b}}]
data modify storage practice:gui tmpl set value {Slot:3b,id:"minecraft:end_rod",Count:2b,size:3,value:1b,tag:{index:14b,display:{Name:'{"text":"Fly Chance","italic":"false","color":"dark_aqua"}',LoreGray:['{"text":"Ranked","color":"gray","italic":"false"}','{"text":"Vanilla","color":"gray","italic":"false"}','{"text":"Minimal","color":"gray","italic":"false"}'],LoreColor:['{"text":"Ranked","color":"gold","italic":"false"}','{"text":"Vanilla","color":"gold","italic":"false"}','{"text":"Minimal","color":"gold","italic":"false"}']}}}
function zeroboard:settings/install
scoreboard players operation fly_chance settings = #tmpl_value zc_ctrl

scoreboard players set #tmpl_value zc_ctrl -1
scoreboard players set #tmpl_default zc_ctrl -1
execute store result score #tmpl_value zc_ctrl run data get storage practice:gui pages[1].entries[{tag:{index:15b}}].value
execute store result score #tmpl_default zc_ctrl run data get storage practice:gui pages[1].defaults[{tag:{index:15b}}].value
data remove storage practice:gui pages[1].entries[{tag:{index:15b}}]
data remove storage practice:gui pages[1].defaults[{tag:{index:15b}}]
data modify storage practice:gui tmpl set value {Slot:4b,id:"minecraft:end_crystal",Count:2b,size:3,value:1b,tag:{index:15b,display:{Name:'{"text":"On Crystal Break","italic":"false","color":"dark_aqua"}',LoreGray:['{"text":"No Fly","color":"gray","italic":"false"}','{"text":"Always Fly","color":"gray","italic":"false"}','{"text":"Vanilla","color":"gray","italic":"false"}'],LoreColor:['{"text":"No Fly","color":"gold","italic":"false"}','{"text":"Always Fly","color":"gold","italic":"false"}','{"text":"Vanilla","color":"gold","italic":"false"}']}}}
function zeroboard:settings/install
scoreboard players operation crystal_break settings = #tmpl_value zc_ctrl

scoreboard players set #tmpl_value zc_ctrl -1
scoreboard players set #tmpl_default zc_ctrl -1
execute store result score #tmpl_value zc_ctrl run data get storage practice:gui pages[1].entries[{tag:{index:16b}}].value
execute store result score #tmpl_default zc_ctrl run data get storage practice:gui pages[1].defaults[{tag:{index:16b}}].value
data remove storage practice:gui pages[1].entries[{tag:{index:16b}}]
data remove storage practice:gui pages[1].defaults[{tag:{index:16b}}]
data modify storage practice:gui tmpl set value {Slot:5b,id:"minecraft:fire_charge",Count:1b,size:2,value:0b,tag:{index:16b,display:{Name:'{"text":"Fireball Chance","italic":"false","color":"dark_aqua"}',LoreGray:['{"text":"Reduced","color":"gray","italic":"false"}','{"text":"Vanilla","color":"gray","italic":"false"}'],LoreColor:['{"text":"Reduced","color":"gold","italic":"false"}','{"text":"Vanilla","color":"gold","italic":"false"}']}}}
function zeroboard:settings/install
scoreboard players operation fireball_chance settings = #tmpl_value zc_ctrl

# 1/8 Always Fly was removed in 1.1.4.1; index 17 is Timing Tracker now, so drop the
# old entry once instead of carrying its value over
execute unless score #timing_v1 zc_ctrl matches 1 run data remove storage practice:gui pages[1].entries[{tag:{index:17b}}]
execute unless score #timing_v1 zc_ctrl matches 1 run data remove storage practice:gui pages[1].defaults[{tag:{index:17b}}]
scoreboard players set #timing_v1 zc_ctrl 1

scoreboard players set #tmpl_value zc_ctrl -1
scoreboard players set #tmpl_default zc_ctrl -1
execute store result score #tmpl_value zc_ctrl run data get storage practice:gui pages[1].entries[{tag:{index:17b}}].value
execute store result score #tmpl_default zc_ctrl run data get storage practice:gui pages[1].defaults[{tag:{index:17b}}].value
data remove storage practice:gui pages[1].entries[{tag:{index:17b}}]
data remove storage practice:gui pages[1].defaults[{tag:{index:17b}}]
data modify storage practice:gui tmpl set value {Slot:6b,id:"minecraft:clock",Count:1b,size:2,value:0b,tag:{index:17b,display:{Name:'{"text":"Timing Tracker","italic":"false","color":"dark_aqua"}',LoreGray:['{"text":"On","color":"gray","italic":"false"}','{"text":"Off","color":"gray","italic":"false"}','{"text":"","italic":"false"}','{"text":"Prints the time of every arrow hit","color":"dark_gray","italic":"false"}','{"text":"and bed explosion","color":"dark_gray","italic":"false"}'],LoreColor:['{"text":"On","color":"gold","italic":"false"}','{"text":"Off","color":"gold","italic":"false"}','{"text":"","italic":"false"}','{"text":"Prints the time of every arrow hit","color":"dark_gray","italic":"false"}','{"text":"and bed explosion","color":"dark_gray","italic":"false"}']}}}
function zeroboard:settings/install
scoreboard players operation timing_tracker settings = #tmpl_value zc_ctrl

scoreboard players set #tmpl_value zc_ctrl -1
scoreboard players set #tmpl_default zc_ctrl -1
execute store result score #tmpl_value zc_ctrl run data get storage practice:gui pages[1].entries[{tag:{index:19b}}].value
execute store result score #tmpl_default zc_ctrl run data get storage practice:gui pages[1].defaults[{tag:{index:19b}}].value
data remove storage practice:gui pages[1].entries[{tag:{index:19b}}]
data remove storage practice:gui pages[1].defaults[{tag:{index:19b}}]
data modify storage practice:gui tmpl set value {Slot:7b,id:"minecraft:end_portal_frame",Count:1b,size:2,value:0b,tag:{index:19b,display:{Name:'{"text":"Vanilla End Entry","italic":"false","color":"dark_aqua"}',LoreGray:['{"text":"Off","color":"gray","italic":"false"}','{"text":"Dimension Load + Dragon Delay","color":"gray","italic":"false"}'],LoreColor:['{"text":"Off","color":"gold","italic":"false"}','{"text":"Dimension Load + Dragon Delay","color":"gold","italic":"false"}']}}}
function zeroboard:settings/install
scoreboard players operation vanilla_entry settings = #tmpl_value zc_ctrl

# Natural Terrain shipped on by default in the test builds; drop that entry once so
# it comes back off
execute unless score #natural_v2 zc_ctrl matches 1 run data remove storage practice:gui pages[1].entries[{tag:{index:20b}}]
execute unless score #natural_v2 zc_ctrl matches 1 run data remove storage practice:gui pages[1].defaults[{tag:{index:20b}}]
scoreboard players set #natural_v2 zc_ctrl 1

scoreboard players set #tmpl_value zc_ctrl -1
scoreboard players set #tmpl_default zc_ctrl -1
execute if data storage practice:gui pages[1].entries[{tag:{index:20b}}] store result score #tmpl_value zc_ctrl run data get storage practice:gui pages[1].entries[{tag:{index:20b}}].value
execute if data storage practice:gui pages[1].defaults[{tag:{index:20b}}] store result score #tmpl_default zc_ctrl run data get storage practice:gui pages[1].defaults[{tag:{index:20b}}].value
data remove storage practice:gui pages[1].entries[{tag:{index:20b}}]
data remove storage practice:gui pages[1].defaults[{tag:{index:20b}}]
data modify storage practice:gui tmpl set value {Slot:8b,id:"minecraft:chorus_flower",Count:1b,size:2,value:1b,tag:{index:20b,display:{Name:'{"text":"Natural Terrain","italic":"false","color":"dark_aqua"}',LoreGray:['{"text":"On","color":"gray","italic":"false"}','{"text":"Off","color":"gray","italic":"false"}','{"text":"","italic":"false"}','{"text":"Real End terrain around the spawn","color":"dark_gray","italic":"false"}','{"text":"instead of the stand-in cages","color":"dark_gray","italic":"false"}'],LoreColor:['{"text":"On","color":"gold","italic":"false"}','{"text":"Off","color":"gold","italic":"false"}','{"text":"","italic":"false"}','{"text":"Real End terrain around the spawn","color":"dark_gray","italic":"false"}','{"text":"instead of the stand-in cages","color":"dark_gray","italic":"false"}']}}}
function zeroboard:settings/install
scoreboard players operation natural_terrain settings = #tmpl_value zc_ctrl

scoreboard players set #tmpl_value zc_ctrl -1
scoreboard players set #tmpl_default zc_ctrl -1
execute store result score #tmpl_value zc_ctrl run data get storage practice:gui pages[1].entries[{tag:{index:21b}}].value
execute store result score #tmpl_default zc_ctrl run data get storage practice:gui pages[1].defaults[{tag:{index:21b}}].value
data remove storage practice:gui pages[1].entries[{tag:{index:21b}}]
data remove storage practice:gui pages[1].defaults[{tag:{index:21b}}]
data modify storage practice:gui tmpl set value {Slot:18b,id:"minecraft:oak_sign",Count:1b,size:2,value:1b,tag:{index:21b,display:{Name:'{"text":"Reset Info","italic":"false","color":"dark_aqua"}',LoreGray:['{"text":"On","color":"gray","italic":"false"}','{"text":"Off","color":"gray","italic":"false"}','{"text":"","italic":"false"}','{"text":"Prints tower, type and spawn","color":"dark_gray","italic":"false"}','{"text":"on death and manual reset","color":"dark_gray","italic":"false"}'],LoreColor:['{"text":"On","color":"gold","italic":"false"}','{"text":"Off","color":"gold","italic":"false"}','{"text":"","italic":"false"}','{"text":"Prints tower, type and spawn","color":"dark_gray","italic":"false"}','{"text":"on death and manual reset","color":"dark_gray","italic":"false"}']}}}
function zeroboard:settings/install
scoreboard players operation abandon_info settings = #tmpl_value zc_ctrl

# base settings with more than two choices use a 2 item stack. left click empties the
# slot, right click leaves one behind, which practice:gui/click_event reads as the direction
data modify storage practice:gui pages[1].entries[{tag:{index:0b}}].Count set value 2b
data modify storage practice:gui pages[1].entries[{tag:{index:1b}}].Count set value 2b
data modify storage practice:gui pages[1].entries[{tag:{index:3b}}].Count set value 2b
data modify storage practice:gui pages[1].entries[{tag:{index:4b}}].Count set value 2b
data modify storage practice:gui pages[1].entries[{tag:{index:7b}}].Count set value 2b
data modify storage practice:gui pages[1].entries[{tag:{index:8b}}].Count set value 2b
data modify storage practice:gui pages[1].entries[{tag:{index:10b}}].Count set value 2b
data modify storage practice:gui pages[1].entries[{tag:{index:11b}}].Count set value 2b
data modify storage practice:gui pages[1].defaults[{tag:{index:0b}}].Count set value 2b
data modify storage practice:gui pages[1].defaults[{tag:{index:1b}}].Count set value 2b
data modify storage practice:gui pages[1].defaults[{tag:{index:3b}}].Count set value 2b
data modify storage practice:gui pages[1].defaults[{tag:{index:4b}}].Count set value 2b
data modify storage practice:gui pages[1].defaults[{tag:{index:7b}}].Count set value 2b
data modify storage practice:gui pages[1].defaults[{tag:{index:8b}}].Count set value 2b
data modify storage practice:gui pages[1].defaults[{tag:{index:10b}}].Count set value 2b
data modify storage practice:gui pages[1].defaults[{tag:{index:11b}}].Count set value 2b

data modify storage practice:rotation_lookup values set value [[[[I;1095,1795,1144,1147],[I;2240,1805,1146,650],[I;3387,650,649,0],[I;437,658,657,0],[I;1095,1145,1144,0],[I;2240,1147,1146,0]],[[I;901,1800,1799,0],[I;2701,1800,1799,0],[I;901,1800,1799,0],[I;2701,1800,1799,0],[I;901,1800,1799,0],[I;2701,1800,1799,0]]],[[[I;1606,1805,657,650],[I;2264,1795,649,1147],[I;1606,658,657,0],[I;2264,650,649,0],[I;2914,1147,1146,0],[I;461,1145,1144,0]],[[I;2700,1800,1799,0],[I;900,1800,1799,0],[I;2700,1800,1799,0],[I;900,1800,1799,0],[I;2700,1800,1799,0],[I;900,1800,1799,0]]]]
