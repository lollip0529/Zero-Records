# killing the fight's own dragon is the only way back to a killed fight, and it rebuilds
# the exit portal over the fountain. stash that box first and put it back after
execute in minecraft:the_end run clone -4 60 -4 4 93 4 400 0 400
kill 6750dc12-58cc-4e09-9d9c-90f50e72f5b0
execute in minecraft:the_end run clone 400 0 400 408 33 408 -4 60 -4
execute in minecraft:the_end run fill 400 0 400 408 33 408 minecraft:air
scoreboard players set #heal_done zc_ctrl 1
