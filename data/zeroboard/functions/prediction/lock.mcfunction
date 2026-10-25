scoreboard players set #record_id zc_ctrl -1
scoreboard players set #lock_valid zc_ctrl 0
execute store result score #record_id zc_ctrl run data get storage zeroboard:records records[0].id
execute if score #record_id zc_ctrl = #active_record zc_ctrl run scoreboard players set #lock_valid zc_ctrl 1
execute if score #lock_valid zc_ctrl matches 1 run scoreboard players set #finish_locked zc_ctrl 1
scoreboard players set #prediction_ready zc_ctrl 0
scoreboard players set #prediction_announced zc_ctrl 0
scoreboard players set #death_ticks zc_ctrl 0
scoreboard players set #predicted_flight zc_ctrl 0
execute if score #lock_valid zc_ctrl matches 1 store result score #prediction_ready zc_ctrl run data get storage zeroboard:records records[0].prediction_ready
execute if score #lock_valid zc_ctrl matches 1 store result score #prediction_announced zc_ctrl run data get storage zeroboard:records records[0].prediction_announced
execute if score #lock_valid zc_ctrl matches 1 store result score #death_ticks zc_ctrl run data get storage zeroboard:records records[0].death_ticks
execute if score #lock_valid zc_ctrl matches 1 store result score #predicted_flight zc_ctrl run data get storage zeroboard:records records[0].predicted_flight_ticks
execute if score #lock_valid zc_ctrl matches 1 if score #prediction_active zc_ctrl matches 1 if score #prediction_id zc_ctrl = #record_id zc_ctrl in minecraft:the_end run function zeroboard:prediction/cancel
scoreboard players operation #arrival_ticks zc_ctrl = timer timer
scoreboard players operation #actual_flight zc_ctrl = #arrival_ticks zc_ctrl
scoreboard players operation #actual_flight zc_ctrl -= #death_ticks zc_ctrl
scoreboard players set #flight_error zc_ctrl 0
execute if score #prediction_ready zc_ctrl matches 1 if score #predicted_flight zc_ctrl matches 1.. run scoreboard players operation #flight_error zc_ctrl = #actual_flight zc_ctrl
execute if score #prediction_ready zc_ctrl matches 1 if score #predicted_flight zc_ctrl matches 1.. run scoreboard players operation #flight_error zc_ctrl -= #predicted_flight zc_ctrl
execute if score #lock_valid zc_ctrl matches 1 if score #prediction_ready zc_ctrl matches 1 if score #predicted_flight zc_ctrl matches 1.. if score #flight_error zc_ctrl > #prediction_guard zc_ctrl run scoreboard players operation #prediction_guard zc_ctrl = #flight_error zc_ctrl
scoreboard players operation #finish_ticks zc_ctrl = #arrival_ticks zc_ctrl
scoreboard players add #finish_ticks zc_ctrl 199
execute if score #lock_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].arrival_ticks int 1 run scoreboard players get #arrival_ticks zc_ctrl
execute if score #lock_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].actual_flight_ticks int 1 run scoreboard players get #actual_flight zc_ctrl
execute if score #lock_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].flight_error int 1 run scoreboard players get #flight_error zc_ctrl
execute if score #lock_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].prediction_guard int 1 run scoreboard players get #prediction_guard zc_ctrl
execute if score #lock_valid zc_ctrl matches 1 store result storage zeroboard:records records[0].finish_ticks int 1 run scoreboard players get #finish_ticks zc_ctrl
execute if score #lock_valid zc_ctrl matches 1 run data modify storage zeroboard:records records[0] merge value {prediction_pending:0b,prediction_ready:1b,finish_actual:0b,finish_source:2}
execute if score #lock_valid zc_ctrl matches 1 if score #prediction_announced zc_ctrl matches 0 run function zeroboard:prediction/announce
execute if score #lock_valid zc_ctrl matches 1 if score #prediction_announced zc_ctrl matches 1 run function zeroboard:records/personal_best/rebuild
execute if score #lock_valid zc_ctrl matches 1 run scoreboard players set #dirty zc_ctrl 1
