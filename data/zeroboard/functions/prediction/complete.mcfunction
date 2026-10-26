function zeroboard:prediction/validate
execute if score #prediction_valid zc_ctrl matches 0 run function zeroboard:prediction/cancel
scoreboard players set #finish_ticks zc_ctrl 0
execute if score #prediction_valid zc_ctrl matches 1 store result score #finish_ticks zc_ctrl run data get storage zeroboard:records records[0].death_ticks
execute if score #prediction_valid zc_ctrl matches 1 run scoreboard players operation #finish_ticks zc_ctrl += #sim_flight_ticks zc_ctrl
execute if score #prediction_valid zc_ctrl matches 1 run scoreboard players add #finish_ticks zc_ctrl 199
execute if score #prediction_valid zc_ctrl matches 1 run scoreboard players operation #finish_ticks zc_ctrl += #prediction_guard zc_ctrl
execute if score #prediction_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].finish_ticks int 1 run scoreboard players get #finish_ticks zc_ctrl
execute if score #prediction_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].predicted_flight_ticks int 1 run scoreboard players get #sim_flight_ticks zc_ctrl
execute if score #prediction_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].prediction_guard int 1 run scoreboard players get #prediction_guard zc_ctrl
execute if score #prediction_valid zc_ctrl matches 1 run data modify storage zeroboard:records records[0] merge value {prediction_pending:0b,prediction_ready:1b,finish_actual:0b,finish_source:1}
execute if score #prediction_valid zc_ctrl matches 1 run function zeroboard:prediction/announce
execute if score #prediction_valid zc_ctrl matches 1 run scoreboard players set #dirty zc_ctrl 1
function zeroboard:prediction/cancel
