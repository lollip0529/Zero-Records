scoreboard players set #fight_ok zc_ctrl -1
execute in minecraft:the_end as @a[distance=0..,gamemode=!creative,gamemode=!spectator,limit=1] at @s run function zeroboard:fight/check_at
execute if entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run function zeroboard:fight/remove
execute if score #fight_ok zc_ctrl matches 0 run tellraw @a {"text":"Reopen this world once so the dragon hears crystal breaks with On Crystal Break: Vanilla.","color":"gold"}
