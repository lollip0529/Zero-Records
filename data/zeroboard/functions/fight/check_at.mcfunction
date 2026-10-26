scoreboard players set #fight_ok zc_ctrl 0
execute unless entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run summon minecraft:ender_dragon ~ ~-30 ~ {UUID:[I;1733352466,1489784329,-1650683659,242415024],Tags:["zc_fight_park"],NoAI:1b,Silent:1b,DragonPhase:0}
function zeroboard:fight/heal_probe
execute if score #heal_ph zc_ctrl matches 1 run scoreboard players set #fight_ok zc_ctrl 1
