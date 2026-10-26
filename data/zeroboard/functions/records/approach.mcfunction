# approach: rotation*4 + direction*2 + location
scoreboard players operation #approach zc_ctrl = rotation_act settings
scoreboard players operation #approach zc_ctrl *= #c2 zc_ctrl
scoreboard players operation #approach zc_ctrl += direction_act settings
scoreboard players operation #approach zc_ctrl *= #c2 zc_ctrl
scoreboard players operation #approach zc_ctrl += location_act settings
execute if score #approach zc_ctrl matches 0 run data modify storage zeroboard:records work.approach set value "Front Diagonal CW"
execute if score #approach zc_ctrl matches 1 run data modify storage zeroboard:records work.approach set value "Back Diagonal CW"
execute if score #approach zc_ctrl matches 2 run data modify storage zeroboard:records work.approach set value "Front Straight CW"
execute if score #approach zc_ctrl matches 3 run data modify storage zeroboard:records work.approach set value "Back Straight CW"
execute if score #approach zc_ctrl matches 4 run data modify storage zeroboard:records work.approach set value "Front Diagonal CCW"
execute if score #approach zc_ctrl matches 5 run data modify storage zeroboard:records work.approach set value "Back Diagonal CCW"
execute if score #approach zc_ctrl matches 6 run data modify storage zeroboard:records work.approach set value "Front Straight CCW"
execute if score #approach zc_ctrl matches 7 run data modify storage zeroboard:records work.approach set value "Back Straight CCW"
