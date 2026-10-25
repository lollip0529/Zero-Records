execute if score crystal_break settings matches 0 run function practice:crystal_break/no_fly
# queue the path reset before changing a perch to takeoff
execute if score crystal_break settings matches 1 unless score phase stats matches 4..7 unless score phase stats matches 9 in minecraft:the_end run tag @e[type=minecraft:ender_dragon,tag=zc_practice_dragon,limit=1] add zc_crystal_fly_pending
execute if score crystal_break settings matches 1 unless score phase stats matches 4..7 unless score phase stats matches 9 run schedule function practice:crystal_break/always_fly 1t replace
execute if score crystal_break settings matches 1 if score phase stats matches 5..7 in minecraft:the_end run data modify entity @e[type=minecraft:ender_dragon,limit=1] DragonPhase set value 4b
execute if score crystal_break settings matches 1 if score phase stats matches 5..7 run scoreboard players set phase stats 4
execute if score crystal_break settings matches 2 run tellraw @a[tag=debug] {"text":"[DEBUG] Crystal break left Vanilla behavior unchanged","color":"dark_purple"}
