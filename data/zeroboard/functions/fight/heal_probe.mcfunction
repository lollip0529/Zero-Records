# a crystal broken at a survival player: the fight's dragon, if it is ours, strafes them
summon minecraft:end_crystal ~ ~ ~ {Tags:["zc_heal_probe"]}
kill @e[type=minecraft:end_crystal,tag=zc_heal_probe]
scoreboard players set #heal_ph zc_ctrl 0
execute if entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 store result score #heal_ph zc_ctrl run data get entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 DragonPhase
execute if score #heal_ph zc_ctrl matches 1 run function zeroboard:fight/heal_confirm
