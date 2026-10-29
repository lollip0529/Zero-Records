execute if score #heal_done zc_ctrl matches 0 if entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run function zeroboard:fight/remove
function zeroboard:fight/heal_unload
scoreboard players set #heal zc_ctrl 0
