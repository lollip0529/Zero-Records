# the run that was on when the world closed lost its dragon
scoreboard players set #heal_reset zc_ctrl 0
execute as @a[limit=1] run function practice:reset
function zeroboard:fight/heal_load
