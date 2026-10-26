# item_used_on_block only fires once the bed or anchor is already gone, so
# remember what the player was aiming at instead. 20 steps of 0.25 covers reach.
tag @s remove zc_aim_anchor
scoreboard players set #aim_step zc_ctrl 20
function zeroboard:timing/aim_step
