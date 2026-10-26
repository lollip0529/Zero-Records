execute if score #heal_done zc_ctrl matches 0 if entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run function zeroboard:fight/remove
execute in minecraft:the_end run forceload remove 0 0
execute in minecraft:the_end run forceload remove 400 400
scoreboard players set #heal zc_ctrl 0
