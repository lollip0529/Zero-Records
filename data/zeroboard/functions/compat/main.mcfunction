execute as @a[scores={reset=1..}] unless score in_lobby flags matches 1 in minecraft:the_end run function practice:reset
execute as @a[scores={reset_drop=1..}] unless score in_lobby flags matches 1 in minecraft:the_end run function practice:reset
execute as @a[scores={reset_i_pick=1..}] unless score in_lobby flags matches 1 in minecraft:the_end run function practice:reset
execute as @a[scores={reset_g_pick=1..}] unless score in_lobby flags matches 1 in minecraft:the_end run function practice:reset
execute as @a[scores={death=1..}] in minecraft:the_end run function practice:reset
scoreboard players reset * reset

execute if score in_lobby flags matches 0 run function practice:timer/timer

execute if score in_lobby flags matches 1 run function practice:gui/main

execute store result score phase stats run data get entity @e[type=ender_dragon,limit=1] DragonPhase
execute if score in_lobby flags matches 0 run function practice:check_crystals
function practice:fireball_chance

function practice:health_display
execute if score knockback settings matches 0 run function practice:knockback_display

execute if score phase stats matches 0 if score onecycle flags matches 1 run scoreboard players set phase stats 9
execute if score phase stats matches 9 if score diff health matches 1.. run function practice:dragon_killed
# freeze the prediction before the dragon entity despawns
execute unless score onecycle flags matches 1 if score flying_to_fountain flags matches 1 if score phase stats matches 9 if score current health matches ..0 unless score #finish_locked zc_ctrl matches 1 run function zeroboard:prediction/lock
# fountain arrival or collision zeroes Health, leaving only multipart entities
# without DragonPhase. phase stats reads 0 then; active makes confirmation single-fire
# after prediction/lock has sampled the same tick.
execute if score flying_to_fountain flags matches 1 if score active timer matches 1 if score phase stats matches 0 run function practice:finish
# fallback - dragon gone outright (onecycle pins phase stats to 9 once it is)
execute if score flying_to_fountain flags matches 1 if score active timer matches 1 unless entity @e[type=minecraft:ender_dragon,limit=1] run function practice:finish

execute as @a store result score player saturation run data get entity @s foodSaturationLevel
# 21 = keep topped up
execute if score saturation settings matches 21 if score player saturation matches ..1 run effect give @a minecraft:saturation 1 0

execute unless score onecycle flags matches 1 as @a[scores={bed_place=1}] if score timer settings matches 0 if score explosives stats matches 0 run tellraw @a [{"nbt":"time_string","storage":"practice:timeparser","interpret":true},{"text":" 1st Bed Placed","color":"white"}]
scoreboard players set @a[scores={bed_place=1}] bed_place 2

execute if score timing_tracker settings matches 0 if score in_lobby flags matches 0 as @a at @s anchored eyes positioned ^ ^ ^ run function zeroboard:timing/aim
# Fuse:1s at function time means it blows up in this tick's world tick
execute if score timing_tracker settings matches 0 if score in_lobby flags matches 0 as @e[type=minecraft:tnt,nbt={Fuse:1s}] run tellraw @a [{"nbt":"time_string","storage":"practice:timeparser","interpret":true},{"text":" TNT Exploded","color":"white"}]

execute as @a[gamemode=survival] at @s run kill @s[y=30,dy=-10]

execute if score in_lobby flags matches 1 unless score editing_loadout flags matches 1 run function practice:inventory/rename/check

execute if score show_nodes settings matches 0 if score in_lobby flags matches 0 in the_end run function practice:nodes/show
execute if score show_nodes settings matches 1 in the_end run function practice:nodes/show_all

execute unless data storage zeroboard:compat {mcsr:1b} unless score #vanilla_entry_pending zc_ctrl matches 1 in minecraft:overworld positioned 0 0 0 as @a[distance=0..] in minecraft:the_end run tp @s 135 65 0 90 0

scoreboard players enable @a repair
execute if entity @a[scores={repair=1..}] in minecraft:the_end run function practice:level/repair

execute unless score pearl_tracker settings matches 3 unless score in_lobby flags matches 1 run function practice:pearl_tracker/track

execute if score path_tracer settings matches 1 run function practice:path_tracer

# sim needs a real position and heading to start from
execute unless entity @e[type=minecraft:ender_dragon,limit=1] run scoreboard players set #dragon_track_active zc_ctrl 0
execute if entity @e[type=minecraft:ender_dragon,limit=1] if score #dragon_track_active zc_ctrl matches 1 run function zeroboard:prediction/track_update
execute if entity @e[type=minecraft:ender_dragon,limit=1] if score #dragon_track_active zc_ctrl matches 0 run function zeroboard:prediction/track_init
