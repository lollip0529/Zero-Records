execute in minecraft:the_end positioned 0 128 0 if entity @a[distance=..192] run scoreboard players add #heal_seen zc_ctrl 1
# any other live dragon could be the one the fight picks
execute in minecraft:the_end as @e[type=minecraft:ender_dragon,distance=0..,tag=!zc_fight_park,nbt={DeathTime:0s}] run function zeroboard:fight/heal_hop
execute if score #heal_done zc_ctrl matches 0 unless entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 in minecraft:the_end run summon minecraft:ender_dragon 0 -20 0 {UUID:[I;1733352466,1489784329,-1650683659,242415024],Tags:["zc_fight_park"],NoAI:1b,Silent:1b,DragonPhase:0}
scoreboard players set #heal_ph zc_ctrl 0
execute if score #heal_done zc_ctrl matches 0 in minecraft:the_end positioned 0 128 0 as @a[distance=..192,gamemode=!creative,gamemode=!spectator,limit=1] at @s run function zeroboard:fight/heal_probe
execute if score #heal_done zc_ctrl matches 0 if score #heal_ph zc_ctrl matches 1 run function zeroboard:fight/heal_confirm
execute if score #heal_reset zc_ctrl matches 1 if entity @a run function zeroboard:fight/heal_reset
execute if score #heal_done zc_ctrl matches 1 if score #heal_seen zc_ctrl matches 200.. run function zeroboard:fight/heal_end
execute if score #heal_seen zc_ctrl matches 2400.. run function zeroboard:fight/heal_end
