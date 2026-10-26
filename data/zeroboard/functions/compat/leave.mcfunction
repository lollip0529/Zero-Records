scoreboard players set #zero_active zc_ctrl 0
schedule clear practice:tp_player
schedule clear practice:spawn_dragon
schedule clear practice:level/refill_nodes
schedule clear practice:crystal_break/always_fly
schedule clear zeroboard:settings/clear_hunger
schedule clear zeroboard:display/rearm_clicks
schedule clear zeroboard:records/clear/disarm
function zeroboard:prediction/cancel
# nothing counts its death once the packs are off
execute if entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run function zeroboard:fight/remove
execute if score #vanilla_entry_pending zc_ctrl matches 1 in minecraft:overworld run fill 495 249 495 505 249 505 minecraft:air replace minecraft:barrier
execute if score #vanilla_entry_pending zc_ctrl matches 1 in minecraft:overworld run forceload remove 495 495 505 505
scoreboard players set #vanilla_entry_pending zc_ctrl 0
