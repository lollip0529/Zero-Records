scoreboard players set mod rng 7
function practice:random/generate
scoreboard players operation spawn_act settings = r rng
scoreboard players add spawn_act settings 11
