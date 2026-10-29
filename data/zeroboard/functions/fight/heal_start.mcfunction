# a world's fight keeps whichever dragon is alive the first time a player comes near after
# a load, so quitting mid-run leaves it on that run's dragon. park our UUID's dragon under
# the island for that check, see fight/heal
scoreboard players set #heal zc_ctrl 1
scoreboard players set #heal_seen zc_ctrl 0
scoreboard players set #heal_done zc_ctrl 0
scoreboard players set #heal_reset zc_ctrl 0
function zeroboard:fight/heal_load
