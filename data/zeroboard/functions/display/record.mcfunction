scoreboard players set ZRTower zc_ctrl 0
scoreboard players set ZRStand zc_ctrl 0
scoreboard players set ZRCover zc_ctrl -1
scoreboard players set ZRBuried zc_ctrl -1
scoreboard players set ZRPick zc_ctrl 0
scoreboard players set ZRFist zc_ctrl 0
scoreboard players set ZRDeathTicks zc_ctrl 0
scoreboard players set ZRFinishTicks zc_ctrl 0
scoreboard players set ZRApproach zc_ctrl -1
scoreboard players set ZRAngle zc_ctrl -1
scoreboard players set ZRSpeed zc_ctrl -1
execute store result score ZRTower zc_ctrl run data get storage zeroboard:records work.render.tower
execute store result score ZRStand zc_ctrl run data get storage zeroboard:records work.render.standing
execute store result score ZRCover zc_ctrl run data get storage zeroboard:records work.render.cover
execute store result score ZRBuried zc_ctrl run data get storage zeroboard:records work.render.buried
execute store result score ZRPick zc_ctrl run data get storage zeroboard:records work.render.pickaxe_code
execute store result score ZRDeathTicks zc_ctrl run data get storage zeroboard:records work.render.death_ticks
execute store result score ZRFinishTicks zc_ctrl run data get storage zeroboard:records work.render.finish_ticks
execute store result score ZRApproach zc_ctrl run data get storage zeroboard:records work.render.approach_code
execute if data storage zeroboard:records work.render.angle store result score ZRAngle zc_ctrl run data get storage zeroboard:records work.render.angle
execute if data storage zeroboard:records work.render.speed store result score ZRSpeed zc_ctrl run data get storage zeroboard:records work.render.speed
execute if data storage zeroboard:records work.render{cover:2,pickaxe:"Fist"} run scoreboard players set ZRFist zc_ctrl 1
execute if score ZRCover zc_ctrl matches 0 run scoreboard players set ZRPick zc_ctrl 0

data modify storage zeroboard:records work.render.tower_short set value "Unknown"
execute if score ZRTower zc_ctrl matches 76 run data modify storage zeroboard:records work.render.tower_short set value "S-76"
execute if score ZRTower zc_ctrl matches 79 run data modify storage zeroboard:records work.render.tower_short set value "C-79"
execute if score ZRTower zc_ctrl matches 82 run data modify storage zeroboard:records work.render.tower_short set value "C-82"
execute if score ZRTower zc_ctrl matches 85 run data modify storage zeroboard:records work.render.tower_short set value "M-85"
execute if score ZRTower zc_ctrl matches 88 run data modify storage zeroboard:records work.render.tower_short set value "M-88"
execute if score ZRTower zc_ctrl matches 91 run data modify storage zeroboard:records work.render.tower_short set value "M-91"
execute if score ZRTower zc_ctrl matches 94 run data modify storage zeroboard:records work.render.tower_short set value "T-94"
execute if score ZRTower zc_ctrl matches 97 run data modify storage zeroboard:records work.render.tower_short set value "T-97"
execute if score ZRTower zc_ctrl matches 100 run data modify storage zeroboard:records work.render.tower_short set value "T-100"
execute if score ZRTower zc_ctrl matches 103 run data modify storage zeroboard:records work.render.tower_short set value "TB-103"

# death time, or the finish when that mode is on and one exists
scoreboard players operation ZRTimeTicks zc_ctrl = ZRDeathTicks zc_ctrl
execute if score #time_mode zc_ctrl matches 1 if score ZRFinishTicks zc_ctrl matches 1.. run scoreboard players operation ZRTimeTicks zc_ctrl = ZRFinishTicks zc_ctrl

scoreboard players operation ZRTotalSec zc_ctrl = ZRTimeTicks zc_ctrl
scoreboard players operation ZRTotalSec zc_ctrl /= #c20 zc_ctrl
scoreboard players operation ZRHun zc_ctrl = ZRTimeTicks zc_ctrl
scoreboard players operation ZRHun zc_ctrl %= #c20 zc_ctrl
scoreboard players operation ZRHun zc_ctrl *= #c5 zc_ctrl

data modify storage zeroboard:records work.render.spawn_short set value "Unknown"
execute if score ZRCover zc_ctrl matches 0 run data modify storage zeroboard:records work.render.spawn_short set value "Open"
execute if score ZRCover zc_ctrl matches 1 run data modify storage zeroboard:records work.render.spawn_short set value "Overhang"
execute if score ZRBuried zc_ctrl matches 52 run data modify storage zeroboard:records work.render.spawn_short set value "O52"
execute if score ZRBuried zc_ctrl matches 53 run data modify storage zeroboard:records work.render.spawn_short set value "O53"
execute if score ZRBuried zc_ctrl matches 54 run data modify storage zeroboard:records work.render.spawn_short set value "O54"
execute if score ZRBuried zc_ctrl matches 55 run data modify storage zeroboard:records work.render.spawn_short set value "O55"
execute if score ZRBuried zc_ctrl matches 56 run data modify storage zeroboard:records work.render.spawn_short set value "O56"
execute if score ZRBuried zc_ctrl matches 57 run data modify storage zeroboard:records work.render.spawn_short set value "O57"
execute if score ZRBuried zc_ctrl matches 58 run data modify storage zeroboard:records work.render.spawn_short set value "O58"
execute if score ZRBuried zc_ctrl matches 59 run data modify storage zeroboard:records work.render.spawn_short set value "O59"
execute if score ZRBuried zc_ctrl matches 60 run data modify storage zeroboard:records work.render.spawn_short set value "O60"
execute if score ZRBuried zc_ctrl matches 61 run data modify storage zeroboard:records work.render.spawn_short set value "O61"
execute if score ZRBuried zc_ctrl matches 62 run data modify storage zeroboard:records work.render.spawn_short set value "O62"
execute if score ZRBuried zc_ctrl matches 63 run data modify storage zeroboard:records work.render.spawn_short set value "O63"
execute if score ZRBuried zc_ctrl matches 64 run data modify storage zeroboard:records work.render.spawn_short set value "O64"
execute if score ZRBuried zc_ctrl matches 65 run data modify storage zeroboard:records work.render.spawn_short set value "O65"
execute if score ZRBuried zc_ctrl matches 66 run data modify storage zeroboard:records work.render.spawn_short set value "O66"
data modify storage zeroboard:records work.render.approach_short set value "Unknown"
execute if score ZRApproach zc_ctrl matches 0 run data modify storage zeroboard:records work.render.approach_short set value "Front CW"
execute if score ZRApproach zc_ctrl matches 1 run data modify storage zeroboard:records work.render.approach_short set value "Back CW"
execute if score ZRApproach zc_ctrl matches 2 run data modify storage zeroboard:records work.render.approach_short set value "Front 1/8 CW"
execute if score ZRApproach zc_ctrl matches 3 run data modify storage zeroboard:records work.render.approach_short set value "Back 1/8 CW"
execute if score ZRApproach zc_ctrl matches 4 run data modify storage zeroboard:records work.render.approach_short set value "Front CCW"
execute if score ZRApproach zc_ctrl matches 5 run data modify storage zeroboard:records work.render.approach_short set value "Back CCW"
execute if score ZRApproach zc_ctrl matches 6 run data modify storage zeroboard:records work.render.approach_short set value "Front 1/8 CCW"
execute if score ZRApproach zc_ctrl matches 7 run data modify storage zeroboard:records work.render.approach_short set value "Back 1/8 CCW"

# diagonal: fast / slow from the band the spawn angle fell in
execute if score ZRSpeed zc_ctrl matches 0 if score ZRApproach zc_ctrl matches 0 run data modify storage zeroboard:records work.render.approach_short set value "Front Fast CW"
execute if score ZRSpeed zc_ctrl matches 0 if score ZRApproach zc_ctrl matches 1 run data modify storage zeroboard:records work.render.approach_short set value "Back Fast CW"
execute if score ZRSpeed zc_ctrl matches 0 if score ZRApproach zc_ctrl matches 4 run data modify storage zeroboard:records work.render.approach_short set value "Front Fast CCW"
execute if score ZRSpeed zc_ctrl matches 0 if score ZRApproach zc_ctrl matches 5 run data modify storage zeroboard:records work.render.approach_short set value "Back Fast CCW"
execute if score ZRSpeed zc_ctrl matches 1 if score ZRApproach zc_ctrl matches 0 run data modify storage zeroboard:records work.render.approach_short set value "Front Slow CW"
execute if score ZRSpeed zc_ctrl matches 1 if score ZRApproach zc_ctrl matches 1 run data modify storage zeroboard:records work.render.approach_short set value "Back Slow CW"
execute if score ZRSpeed zc_ctrl matches 1 if score ZRApproach zc_ctrl matches 4 run data modify storage zeroboard:records work.render.approach_short set value "Front Slow CCW"
execute if score ZRSpeed zc_ctrl matches 1 if score ZRApproach zc_ctrl matches 5 run data modify storage zeroboard:records work.render.approach_short set value "Back Slow CCW"
scoreboard players operation ZRAngleWhole zc_ctrl = ZRAngle zc_ctrl
scoreboard players operation ZRAngleWhole zc_ctrl /= #c10 zc_ctrl
scoreboard players operation ZRAngleTenth zc_ctrl = ZRAngle zc_ctrl
scoreboard players operation ZRAngleTenth zc_ctrl %= #c10 zc_ctrl
# spawn angle, records from before it was kept have none
data modify storage zeroboard:records work.render.angle_text set value '""'
execute if score ZRAngle zc_ctrl matches 0.. run data modify storage zeroboard:records work.render.angle_text set value '[{"text":" ("},{"score":{"name":"ZRAngleWhole","objective":"zc_ctrl"}},{"text":"."},{"score":{"name":"ZRAngleTenth","objective":"zc_ctrl"}},{"text":")"}]'

execute if score ZRHun zc_ctrl matches 0 as @e[tag=zc_target_line1,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line1_whole
execute if score ZRHun zc_ctrl matches 1..9 as @e[tag=zc_target_line1,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line1_low
execute if score ZRHun zc_ctrl matches 10.. as @e[tag=zc_target_line1,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line1
data modify entity @e[tag=zc_target_line1,limit=1] CustomName set from block 139 63 0 Items[{Slot:0b}].tag.display.Name
execute if score ZRPick zc_ctrl matches 0 as @e[tag=zc_target_line2,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line2
execute if score ZRFist zc_ctrl matches 1 as @e[tag=zc_target_line2,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line2_none
execute if score ZRPick zc_ctrl matches 1 as @e[tag=zc_target_line2,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line2_stone
execute if score ZRPick zc_ctrl matches 2 as @e[tag=zc_target_line2,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line2_iron
execute if score ZRPick zc_ctrl matches 3 as @e[tag=zc_target_line2,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line2_diamond
execute if score ZRPick zc_ctrl matches 4 as @e[tag=zc_target_line2,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line2_netherite
execute if score ZRPick zc_ctrl matches 5 as @e[tag=zc_target_line2,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line2_gold
execute if score ZRPick zc_ctrl matches 6 as @e[tag=zc_target_line2,limit=1] at @s run loot replace block 139 63 0 container.0 loot zeroboard:render/line2_wood
data modify entity @e[tag=zc_target_line2,limit=1] CustomName set from block 139 63 0 Items[{Slot:0b}].tag.display.Name
data merge entity @e[tag=zc_target_line1,limit=1] {CustomNameVisible:1b}
data merge entity @e[tag=zc_target_line2,limit=1] {CustomNameVisible:1b}
