data modify storage practice:gui pages[1].entries set from storage practice:gui pages[1].defaults

execute store result score location settings run data get storage practice:gui pages[1].entries[{tag:{index:0b}}].value
execute store result score direction settings run data get storage practice:gui pages[1].entries[{tag:{index:1b}}].value
execute store result score damage settings run data get storage practice:gui pages[1].entries[{tag:{index:2b}}].value
execute store result score saturation settings run data get storage practice:gui pages[1].entries[{tag:{index:3b}}].value
execute store result score spawn settings run data get storage practice:gui pages[1].entries[{tag:{index:4b}}].value
execute store result score knockback settings run data get storage practice:gui pages[1].entries[{tag:{index:5b}}].value
execute store result score timer settings run data get storage practice:gui pages[1].entries[{tag:{index:6b}}].value
execute store result score rotation settings run data get storage practice:gui pages[1].entries[{tag:{index:7b}}].value
execute store result score randomize settings run data get storage practice:gui pages[1].entries[{tag:{index:8b}}].value
execute store result score iframe settings run data get storage practice:gui pages[1].entries[{tag:{index:9b}}].value
execute store result score show_nodes settings run data get storage practice:gui pages[1].entries[{tag:{index:10b}}].value
execute store result score pearl_tracker settings run data get storage practice:gui pages[1].entries[{tag:{index:11b}}].value
execute store result score fireres settings run data get storage practice:gui pages[1].entries[{tag:{index:12b}}].value
execute store result score disable_dragon settings run data get storage practice:gui pages[1].entries[{tag:{index:13b}}].value
execute store result score fly_chance settings run data get storage practice:gui pages[1].entries[{tag:{index:14b}}].value
execute store result score crystal_break settings run data get storage practice:gui pages[1].entries[{tag:{index:15b}}].value
execute store result score fireball_chance settings run data get storage practice:gui pages[1].entries[{tag:{index:16b}}].value
execute store result score timing_tracker settings run data get storage practice:gui pages[1].entries[{tag:{index:17b}}].value
execute store result score vanilla_entry settings run data get storage practice:gui pages[1].entries[{tag:{index:19b}}].value
execute store result score natural_terrain settings run data get storage practice:gui pages[1].entries[{tag:{index:20b}}].value
execute store result score abandon_info settings run data get storage practice:gui pages[1].entries[{tag:{index:21b}}].value

function practice:gui/pages/home/enable_all_towers
function practice:gui/pages/settings/spawn_pool/enable_all

execute if data storage zero_practice_loadouts:loadouts default_loadouts run data modify storage zero_practice_loadouts:loadouts loadouts set from storage zero_practice_loadouts:loadouts default_loadouts
execute if data storage practice:loadouts default_loadouts run data modify storage practice:loadouts loadouts set from storage practice:loadouts default_loadouts
scoreboard players set loadout inv 0

scoreboard objectives setdisplay sidebar

function practice:level/repair
function practice:reset

tellraw @a [{"text":"Default Values Loaded","color":"dark_red"}]
