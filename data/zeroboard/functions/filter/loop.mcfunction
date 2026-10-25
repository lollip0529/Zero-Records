data modify storage zeroboard:records work.current set from storage zeroboard:records work.source[0]

execute store result score #run_height zc_ctrl run data get storage zeroboard:records work.current.standing
execute store result score #run_base zc_ctrl run data get storage zeroboard:records work.current.base
execute store result score #run_plus zc_ctrl run data get storage zeroboard:records work.current.plus
execute store result score #run_tower zc_ctrl run data get storage zeroboard:records work.current.tower
execute store result score #run_cover zc_ctrl run data get storage zeroboard:records work.current.cover
execute store result score #run_buried zc_ctrl run data get storage zeroboard:records work.current.buried
execute store result score #run_pickaxe zc_ctrl run data get storage zeroboard:records work.current.pickaxe_code

# approach_code is rotation*4 + direction*2 + location, so the low two bits are the
# location filter's 0..3 (front, back, front 1/8, back 1/8) and the top bit is ccw
scoreboard players set #run_approach zc_ctrl -1
execute store result score #run_approach zc_ctrl run data get storage zeroboard:records work.current.approach_code
scoreboard players operation #run_location zc_ctrl = #run_approach zc_ctrl
scoreboard players operation #run_location zc_ctrl %= #c4 zc_ctrl
scoreboard players operation #run_rotation zc_ctrl = #run_approach zc_ctrl
scoreboard players operation #run_rotation zc_ctrl /= #c4 zc_ctrl

scoreboard players operation #filter_spawn_height zc_ctrl = #filter_spawn zc_ctrl
scoreboard players add #filter_spawn_height zc_ctrl 48
scoreboard players set #match zc_ctrl 1
execute unless score #filter_height zc_ctrl matches -1 unless score #run_height zc_ctrl = #filter_height zc_ctrl run scoreboard players set #match zc_ctrl 0
execute unless score #filter_base zc_ctrl matches -1 unless score #run_base zc_ctrl = #filter_base zc_ctrl run scoreboard players set #match zc_ctrl 0
execute unless score #filter_plus zc_ctrl matches -1 unless score #run_plus zc_ctrl = #filter_plus zc_ctrl run scoreboard players set #match zc_ctrl 0
execute unless score #filter_tower zc_ctrl matches -1 unless score #run_tower zc_ctrl = #filter_tower zc_ctrl run scoreboard players set #match zc_ctrl 0
execute if score #filter_spawn zc_ctrl matches 0 unless score #run_cover zc_ctrl matches 2 run scoreboard players set #match zc_ctrl 0
execute if score #filter_spawn zc_ctrl matches 1 if score #run_cover zc_ctrl matches 0 run scoreboard players set #match zc_ctrl 0
execute if score #filter_spawn zc_ctrl matches 3 unless score #run_cover zc_ctrl matches 0 run scoreboard players set #match zc_ctrl 0
execute if score #filter_spawn zc_ctrl matches 4..18 unless score #run_buried zc_ctrl = #filter_spawn_height zc_ctrl run scoreboard players set #match zc_ctrl 0
execute unless score #filter_pickaxe zc_ctrl matches -1 unless score #run_pickaxe zc_ctrl = #filter_pickaxe zc_ctrl run scoreboard players set #match zc_ctrl 0
execute if score #filter_pickaxe zc_ctrl matches 0 unless data storage zeroboard:records work.current{cover:2,pickaxe:"Fist"} run scoreboard players set #match zc_ctrl 0
execute unless score #filter_location zc_ctrl matches -1 unless score #run_approach zc_ctrl matches 0..7 run scoreboard players set #match zc_ctrl 0
execute unless score #filter_location zc_ctrl matches -1 unless score #run_location zc_ctrl = #filter_location zc_ctrl run scoreboard players set #match zc_ctrl 0
execute unless score #filter_rotation zc_ctrl matches -1 unless score #run_approach zc_ctrl matches 0..7 run scoreboard players set #match zc_ctrl 0
execute unless score #filter_rotation zc_ctrl matches -1 unless score #run_rotation zc_ctrl = #filter_rotation zc_ctrl run scoreboard players set #match zc_ctrl 0

execute if score #match zc_ctrl matches 1 run data modify storage zeroboard:records filtered append from storage zeroboard:records work.current
data remove storage zeroboard:records work.source[0]
execute if data storage zeroboard:records work.source[0] run function zeroboard:filter/loop
