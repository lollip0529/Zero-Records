# Health 0 starts the 200 tick death and @e stops seeing the dragon, the UUID still
# does. count it from here, tick functions run before the dragon does
scoreboard players set #fight_hp zc_ctrl 1
execute if entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 store result score #fight_hp zc_ctrl run data get entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 Health 100
execute if score #fight_hp zc_ctrl matches 1.. run scoreboard players set #fight_death zc_ctrl 0
execute if score #fight_hp zc_ctrl matches ..0 run scoreboard players add #fight_death zc_ctrl 1
execute if score #fight_death zc_ctrl matches 200.. run function zeroboard:fight/expire
