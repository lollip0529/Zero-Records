scoreboard objectives add zc_ctrl dummy
scoreboard players set #zero_active zc_ctrl 0
# MCSR's bastion pack also has practice:init; change_page belongs only to Zero.
execute store success score #zero_active zc_ctrl run function practice:gui/change_page
execute if score #zero_active zc_ctrl matches 1 run function zeroboard:load
execute if score #zero_active zc_ctrl matches 1 if score #heal zc_ctrl matches 1 unless score #heal_warp zc_ctrl matches 1 run function zeroboard:fight/heal_end
# nobody online yet means a world load, not /reload
execute if score #zero_active zc_ctrl matches 1 if score crystal_break settings matches 1 unless entity @a unless data storage zeroboard:compat {mcsr:1b} run function zeroboard:fight/heal_start
execute if score #zero_active zc_ctrl matches 1 if score crystal_break settings matches 1 if score #heal_warp zc_ctrl matches 1 run function zeroboard:fight/heal_start
scoreboard players set #heal_warp zc_ctrl 0
