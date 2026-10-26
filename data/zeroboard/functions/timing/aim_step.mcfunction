execute if block ~ ~ ~ minecraft:respawn_anchor run tag @s add zc_aim_anchor
execute unless block ~ ~ ~ #zeroboard:aim_through run scoreboard players set #aim_step zc_ctrl 0
scoreboard players remove #aim_step zc_ctrl 1
execute if score #aim_step zc_ctrl matches 1.. positioned ^ ^ ^0.25 run function zeroboard:timing/aim_step
