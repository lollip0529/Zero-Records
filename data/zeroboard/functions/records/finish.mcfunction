scoreboard players set #record_id zc_ctrl -1
scoreboard players set #finish_valid zc_ctrl 0
execute store result score #record_id zc_ctrl run data get storage zeroboard:records records[0].id
execute if score #record_id zc_ctrl = #active_record zc_ctrl run scoreboard players set #finish_valid zc_ctrl 1
execute if score #finish_valid zc_ctrl matches 1 run scoreboard players set #finish_locked zc_ctrl 1
execute if score #finish_valid zc_ctrl matches 1 if score #prediction_active zc_ctrl matches 1 if score #prediction_id zc_ctrl = #record_id zc_ctrl in minecraft:the_end run function zeroboard:prediction/cancel
scoreboard players operation #observed_finish zc_ctrl = timer timer
scoreboard players set #arrival_ticks zc_ctrl 0
scoreboard players set #prediction_announced zc_ctrl 0
execute if score #finish_valid zc_ctrl matches 1 store result score #arrival_ticks zc_ctrl run data get storage zeroboard:records records[0].arrival_ticks
execute if score #finish_valid zc_ctrl matches 1 store result score #prediction_announced zc_ctrl run data get storage zeroboard:records records[0].prediction_announced
scoreboard players set #death_tail zc_ctrl 0
scoreboard players set #finish_observation_error zc_ctrl 0
execute if score #arrival_ticks zc_ctrl matches 1.. run scoreboard players operation #death_tail zc_ctrl = #observed_finish zc_ctrl
execute if score #arrival_ticks zc_ctrl matches 1.. run scoreboard players operation #death_tail zc_ctrl -= #arrival_ticks zc_ctrl
execute if score #arrival_ticks zc_ctrl matches 1.. run scoreboard players operation #finish_observation_error zc_ctrl = #death_tail zc_ctrl
execute if score #arrival_ticks zc_ctrl matches 1.. run scoreboard players remove #finish_observation_error zc_ctrl 199
scoreboard players operation #finish_ticks zc_ctrl = #observed_finish zc_ctrl
execute if score #finish_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].finish_ticks int 1 run scoreboard players get #finish_ticks zc_ctrl
execute if score #finish_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].observed_finish_ticks int 1 run scoreboard players get #observed_finish zc_ctrl
execute if score #finish_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].death_tail_ticks int 1 run scoreboard players get #death_tail zc_ctrl
execute if score #finish_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].finish_observation_error int 1 run scoreboard players get #finish_observation_error zc_ctrl
execute if score #finish_valid zc_ctrl matches 1 run data modify storage zeroboard:records records[0] merge value {prediction_pending:0b,prediction_ready:1b,finish_actual:1b,finish_source:3}
execute if score #finish_valid zc_ctrl matches 1 if score #prediction_announced zc_ctrl matches 0 run function zeroboard:prediction/announce
execute if score #finish_valid zc_ctrl matches 1 run function zeroboard:records/personal_best/rebuild
execute if score #finish_valid zc_ctrl matches 1 run scoreboard players set #dirty zc_ctrl 1
