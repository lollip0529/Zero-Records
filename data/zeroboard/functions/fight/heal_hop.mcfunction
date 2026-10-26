# a leftover run's dragon: out of the End the same way fight/remove does it
execute if score in_lobby flags matches 0 run scoreboard players set #heal_reset zc_ctrl 1
execute in minecraft:overworld run forceload add 536 536
execute in minecraft:overworld run tp @s 536 250 536
execute in minecraft:overworld positioned 536 250 536 run kill @e[type=minecraft:ender_dragon,distance=..2]
schedule function zeroboard:fight/unload 5t replace
