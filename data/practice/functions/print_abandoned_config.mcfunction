# prints the resolved attempt config when a run is abandoned (death/manual reset), mirroring the kill screen so random selections are still visible
# called at the top of practice:reset, before scores/storage are cleared

execute if entity @a[scores={death=1..}] run tellraw @a {"text":"\nAttempt failed (death)","color":"red"}
execute unless entity @a[scores={death=1..}] run tellraw @a {"text":"\nAttempt reset","color":"yellow"}

tellraw @a [{"text":"  Tower: "},{"nbt":"active","storage":"practice:towers","color":"green"}]

# base string rotation_act settings
scoreboard players operation #approach zc_ctrl *= #c2 zc_ctrl
scoreboard players operation #approach zc_ctrl += direction_act settings
scoreboard players operation #approach zc_ctrl *= #c2 zc_ctrl
scoreboard players operation #approach zc_ctrl += location_act settings
execute if score #approach zc_ctrl matches 0 run data modify storage zeroboard:records work.kill_type set value "Front Diagonal CW"
execute if score #approach zc_ctrl matches 1 run data modify storage zeroboard:records work.kill_type set value "Back Diagonal CW"
execute if score #approach zc_ctrl matches 2 run data modify storage zeroboard:records work.kill_type set value "Front Straight CW"
execute if score #approach zc_ctrl matches 3 run data modify storage zeroboard:records work.kill_type set value "Back Straight CW"
execute if score #approach zc_ctrl matches 4 run data modify storage zeroboard:records work.kill_type set value "Front Diagonal CCW"
execute if score #approach zc_ctrl matches 5 run data modify storage zeroboard:records work.kill_type set value "Back Diagonal CCW"
execute if score #approach zc_ctrl matches 6 run data modify storage zeroboard:records work.kill_type set value "Front Straight CCW"
execute if score #approach zc_ctrl matches 7 run data modify storage zeroboard:records work.kill_type set value "Back Straight CCW"
# angle_label to upgrade for fast/slow labels
function zeroboard:settings/angle_label
tellraw @a [{"text":"  Type: "},{"nbt":"work.kill_type","storage":"zeroboard:records","color":"green"},{"nbt":"work.kill_angle","storage":"zeroboard:records","interpret":true,"color":"green"}]

# spawn print
execute if score spawn_act settings matches 0 run tellraw @a [{"text":"  Spawn: Open","color":"green"}]
execute if score spawn_act settings matches 1 run tellraw @a [{"text":"  Spawn: Overhang","color":"green"}]
execute if score spawn_act settings matches 3 run tellraw @a [{"text":"  Spawn: Buried 52","color":"green"}]
execute if score spawn_act settings matches 4 run tellraw @a [{"text":"  Spawn: Buried 53","color":"green"}]
execute if score spawn_act settings matches 5 run tellraw @a [{"text":"  Spawn: Buried 54","color":"green"}]
execute if score spawn_act settings matches 6 run tellraw @a [{"text":"  Spawn: Buried 55","color":"green"}]
execute if score spawn_act settings matches 7 run tellraw @a [{"text":"  Spawn: Buried 56","color":"green"}]
execute if score spawn_act settings matches 8 run tellraw @a [{"text":"  Spawn: Buried 57","color":"green"}]
execute if score spawn_act settings matches 9 run tellraw @a [{"text":"  Spawn: Buried 58","color":"green"}]
execute if score spawn_act settings matches 10 run tellraw @a [{"text":"  Spawn: Buried 59","color":"green"}]
execute if score spawn_act settings matches 11 run tellraw @a [{"text":"  Spawn: Buried 60","color":"green"}]
execute if score spawn_act settings matches 12 run tellraw @a [{"text":"  Spawn: Buried 61","color":"green"}]
execute if score spawn_act settings matches 13 run tellraw @a [{"text":"  Spawn: Buried 62","color":"green"}]
execute if score spawn_act settings matches 14 run tellraw @a [{"text":"  Spawn: Buried 63","color":"green"}]
execute if score spawn_act settings matches 15 run tellraw @a [{"text":"  Spawn: Buried 64","color":"green"}]
execute if score spawn_act settings matches 16 run tellraw @a [{"text":"  Spawn: Buried 65","color":"green"}]
