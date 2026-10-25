execute if score #filter_action zc_ctrl matches 1 run function zeroboard:filter/defaults

execute if score #filter_action zc_ctrl matches 2 run scoreboard players add #filter_location zc_ctrl 1
execute if score #filter_action zc_ctrl matches 2 if score #filter_location zc_ctrl matches 4.. run scoreboard players set #filter_location zc_ctrl -1

execute if score #filter_action zc_ctrl matches 3 run scoreboard players operation #old_filter zc_ctrl = #filter_height zc_ctrl
execute if score #filter_action zc_ctrl matches 3 if score #old_filter zc_ctrl matches -1 run scoreboard players set #filter_height zc_ctrl 78
execute if score #filter_action zc_ctrl matches 3 if score #old_filter zc_ctrl matches 78..110 run scoreboard players add #filter_height zc_ctrl 1
execute if score #filter_action zc_ctrl matches 3 if score #old_filter zc_ctrl matches 111 run scoreboard players set #filter_height zc_ctrl -1

execute if score #filter_action zc_ctrl matches 4 run scoreboard players operation #old_filter zc_ctrl = #filter_base zc_ctrl
execute if score #filter_action zc_ctrl matches 4 if score #old_filter zc_ctrl matches -1 run scoreboard players set #filter_base zc_ctrl 1
execute if score #filter_action zc_ctrl matches 4 if score #old_filter zc_ctrl matches 1..9 run scoreboard players add #filter_base zc_ctrl 1
execute if score #filter_action zc_ctrl matches 4 if score #old_filter zc_ctrl matches 10 run scoreboard players set #filter_base zc_ctrl -1

execute if score #filter_action zc_ctrl matches 5 run scoreboard players operation #old_filter zc_ctrl = #filter_plus zc_ctrl
execute if score #filter_action zc_ctrl matches 5 if score #old_filter zc_ctrl matches -1 run scoreboard players set #filter_plus zc_ctrl 0
execute if score #filter_action zc_ctrl matches 5 if score #old_filter zc_ctrl matches 0..9 run scoreboard players add #filter_plus zc_ctrl 1
execute if score #filter_action zc_ctrl matches 5 if score #old_filter zc_ctrl matches 10 run scoreboard players set #filter_plus zc_ctrl -1

execute if score #filter_action zc_ctrl matches 6 run scoreboard players operation #old_filter zc_ctrl = #filter_tower zc_ctrl
execute if score #filter_action zc_ctrl matches 6 if score #old_filter zc_ctrl matches -1 run scoreboard players set #filter_tower zc_ctrl 76
execute if score #filter_action zc_ctrl matches 6 if score #old_filter zc_ctrl matches 76..102 run scoreboard players add #filter_tower zc_ctrl 3
execute if score #filter_action zc_ctrl matches 6 if score #old_filter zc_ctrl matches 103 run scoreboard players set #filter_tower zc_ctrl -1

execute if score #filter_action zc_ctrl matches 7 run scoreboard players add #filter_spawn zc_ctrl 1
execute if score #filter_action zc_ctrl matches 7 if score #filter_spawn zc_ctrl matches 19.. run scoreboard players set #filter_spawn zc_ctrl 0

execute if score #filter_action zc_ctrl matches 8 run scoreboard players operation #old_filter zc_ctrl = #filter_pickaxe zc_ctrl
execute if score #filter_action zc_ctrl matches 8 if score #old_filter zc_ctrl matches -1 run scoreboard players set #filter_pickaxe zc_ctrl 5
execute if score #filter_action zc_ctrl matches 8 if score #old_filter zc_ctrl matches 5 run scoreboard players set #filter_pickaxe zc_ctrl 4
execute if score #filter_action zc_ctrl matches 8 if score #old_filter zc_ctrl matches 4 run scoreboard players set #filter_pickaxe zc_ctrl 3
execute if score #filter_action zc_ctrl matches 8 if score #old_filter zc_ctrl matches 3 run scoreboard players set #filter_pickaxe zc_ctrl 2
execute if score #filter_action zc_ctrl matches 8 if score #old_filter zc_ctrl matches 2 run scoreboard players set #filter_pickaxe zc_ctrl 1
execute if score #filter_action zc_ctrl matches 8 if score #old_filter zc_ctrl matches 1 run scoreboard players set #filter_pickaxe zc_ctrl 6
execute if score #filter_action zc_ctrl matches 8 if score #old_filter zc_ctrl matches 6 run scoreboard players set #filter_pickaxe zc_ctrl 0
execute if score #filter_action zc_ctrl matches 8 if score #old_filter zc_ctrl matches 0 run scoreboard players set #filter_pickaxe zc_ctrl -1

execute if score #filter_action zc_ctrl matches 9 run scoreboard players add #filter_rotation zc_ctrl 1
execute if score #filter_action zc_ctrl matches 9 if score #filter_rotation zc_ctrl matches 2.. run scoreboard players set #filter_rotation zc_ctrl -1

scoreboard players set #page zc_ctrl 0
function zeroboard:filter/apply
function zeroboard:menu/clean
function zeroboard:menu/build
playsound minecraft:ui.button.click master @s ~ ~ ~
title @s actionbar {"text":"Zero-cycle filters updated","color":"aqua"}
scoreboard players set #filter_action zc_ctrl 0
