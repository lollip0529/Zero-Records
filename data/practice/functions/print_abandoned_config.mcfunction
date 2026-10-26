# prints the resolved attempt config when a run is abandoned (death/manual reset), mirroring the kill screen so random selections are still visible
# called at the top of practice:reset, before scores/storage are cleared

execute if entity @a[scores={death=1..}] run tellraw @a {"text":"\nAttempt Failed","color":"red"}
execute unless entity @a[scores={death=1..}] run tellraw @a {"text":"\nAttempt Reset","color":"red"}

tellraw @a [{"text":"  Tower: "},{"nbt":"active","storage":"practice:towers","color":"green"}]

function zeroboard:records/approach
data modify storage zeroboard:records work.kill_type set from storage zeroboard:records work.approach
# angle_act and speed_act are rolled in practice:spawn_dragon, before that they still hold the last attempt's
data modify storage zeroboard:records work.kill_angle set value '""'
execute if entity @e[type=minecraft:ender_dragon,tag=zc_practice_dragon,limit=1] run function zeroboard:settings/angle_label
tellraw @a [{"text":"  Type: "},{"nbt":"work.kill_type","storage":"zeroboard:records","color":"green"},{"nbt":"work.kill_angle","storage":"zeroboard:records","interpret":true,"color":"green"}]

scoreboard players operation #spawn_buried zc_ctrl = spawn_act settings
scoreboard players add #spawn_buried zc_ctrl 49
execute if score spawn_act settings matches 0 run tellraw @a [{"text":"  Spawn: "},{"text":"Open","color":"green"}]
execute if score spawn_act settings matches 1 run tellraw @a [{"text":"  Spawn: "},{"text":"Overhang","color":"green"}]
execute if score spawn_act settings matches 3.. run tellraw @a [{"text":"  Spawn: "},{"text":"Buried ","color":"green"},{"score":{"name":"#spawn_buried","objective":"zc_ctrl"},"color":"green"}]
