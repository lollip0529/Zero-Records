# a run started this soon after loading keeps its dragon
execute if score #heal zc_ctrl matches 1 run function zeroboard:fight/heal_end
# clear any dragon left by the previous attempt before the new one. a completed
# attempt keeps its full death animation until restart.
function practice:cleanup_dragon

scoreboard players operation location_act settings = location settings
execute if score location settings matches 2 run scoreboard players set location_act settings 0
execute if score location settings matches 2 if predicate practice:rand_50 run scoreboard players set location_act settings 1

scoreboard players operation direction_act settings = direction settings
execute if score direction settings matches 2 run scoreboard players set direction_act settings 0
execute if score direction settings matches 2 if predicate practice:rand_12.5 run scoreboard players set direction_act settings 1

# resolve cw/ccw and the normal/fast/slow lookup together.
function zeroboard:settings/angles

function practice:level/load_fountain
function practice:level/load_spawn
function practice:level/choose_tower
function practice:level/set_tower_order
function practice:level/load_towers
function practice:level/load_terrain
function practice:nodes/force

# spawn dragon. Vanilla End Entry brings the player back first, then the dragon
# a beat later like a freshly loaded End fight.
execute if score disable_dragon settings matches 0 if score vanilla_entry settings matches 0 run schedule function practice:spawn_dragon 1t replace
execute if score disable_dragon settings matches 0 if score vanilla_entry settings matches 1 run schedule function practice:spawn_dragon 30t replace

execute if score editing_loadout flags matches 1 run function practice:inventory/save_loadout
execute if score renaming flags matches 1 run function practice:inventory/rename/renamed

execute in minecraft:the_end run spawnpoint @a 135 65 0
function practice:entry/start
execute if score vanilla_entry settings matches 0 run schedule function practice:tp_player 1t replace
execute if score vanilla_entry settings matches 1 run schedule function practice:tp_player 10t replace
gamemode survival @a
execute as @a run function practice:inventory/loadinv
effect clear @a
effect give @a minecraft:instant_health 10 10 true
clear @s writable_book
execute if score randomize settings matches 0 run loot give @a loot practice:junk
clear @a glass_pane
execute if score fireres settings matches 0 run effect give @a minecraft:fire_resistance 10000 0

scoreboard players set timer timer 0
scoreboard players set active timer 1
scoreboard players set in_lobby flags 0
scoreboard players set explosives stats 0
scoreboard players set plus_1 stats 0
scoreboard players set damage_time health 0
scoreboard players reset * rotation
scoreboard players reset * bed_place

fill -2 60 2 2 60 -2 air replace minecraft:end_portal
bossbar set minecraft:dragon visible true
bossbar set minecraft:dragon players @a
title @a times 0 10 0

function zeroboard:settings/saturation

difficulty easy

execute in minecraft:the_end run function practice:custom_commands/create
