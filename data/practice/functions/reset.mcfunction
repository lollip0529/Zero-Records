# show the resolved random config on abandon if setting enabled
execute if score in_lobby flags matches 0 if score active timer matches 1 unless score flying_to_fountain flags matches 1 unless score onecycle flags matches 1 if score abandon_info settings matches 0 run function practice:print_abandoned_config
# a reset abandons the run - flush the prediction before the markers go
execute if score #prediction_active zc_ctrl matches 1 in minecraft:the_end run function zeroboard:prediction/force_finish
schedule clear practice:tp_player
schedule clear practice:spawn_dragon
schedule clear practice:level/refill_nodes
# reset can interrupt node probing; restore the terrain after clearing its schedule
# so temporary columns and barriers cannot affect the next attempt.
function practice:level/refill_nodes

function practice:cleanup_dragon
# #practice:remove includes ender_dragon; cleanup_dragon owns dragon removal, so
# keep it out of this kill
kill @e[type=#practice:remove,type=!minecraft:ender_dragon]

execute in minecraft:overworld run fill 495 249 495 505 249 505 minecraft:air replace minecraft:barrier
execute in minecraft:overworld run forceload remove 495 495 505 505
execute in minecraft:the_end run forceload remove -80 -80 80 80
execute in minecraft:the_end run tp @a 135 65 0 90 0
execute if score onecycle flags matches 1 in minecraft:the_end run tp @a 135 65 0 90 -20
clear @a
effect clear @a
effect give @a minecraft:instant_health 10 10 true
effect give @a[scores={death=1..}] minecraft:hunger 1 255
stopsound @a
gamemode survival @a

function practice:level/clear
function zeroboard:settings/clear_y128

scoreboard players set active timer 0
scoreboard players reset * reset
scoreboard players reset * reset_drop
scoreboard players reset * reset_i_pick
scoreboard players reset * reset_g_pick
scoreboard players reset * death
scoreboard players reset * height
scoreboard players reset * pearl
scoreboard players set in_lobby flags 1
scoreboard players reset onecycle flags
scoreboard players reset flying_to_fountain flags
scoreboard players set #vanilla_entry_pending zc_ctrl 0

bossbar set minecraft:dragon visible false
bossbar set minecraft:dragon players
advancement revoke @a only minecraft:end/kill_dragon

tellraw @a {"text":""}

execute as @a[nbt=!{Fire:-20s}] at @s run function practice:extinguish/extinguish

difficulty peaceful

kill @e[tag=dragon_pos]
kill @e[type=armor_stand,tag=healing]
kill @e[tag=save]

setblock 0 73 0 air
