# settings/angles selects the spawn rotation lookup row.
execute store result score start rng run data get storage practice:rotation_lookup temp[0]
execute store result score mod rng run data get storage practice:rotation_lookup temp[1]
execute store result score size1 rng run data get storage practice:rotation_lookup temp[2]
execute store result score gap rng run data get storage practice:rotation_lookup temp[3]

function practice:random/generate
execute if score r rng > size1 rng run scoreboard players operation r rng += gap rng
scoreboard players operation r rng += start rng
scoreboard players operation r rng %= 3600 c

execute if score rotation settings matches 3 run scoreboard players operation r rng = value custom_rotation

scoreboard players operation angle_act settings = r rng
scoreboard players operation angle_act settings %= #c3600 zc_ctrl
function zeroboard:settings/angle_band

tellraw @a[tag=debug] [{"text":"[DEBUG] Rotation: ","color":"dark_purple"},{"score":{"name":"r","objective":"rng"}}]

execute if score r rng matches 0..449 in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {Tags:["zc_practice_dragon"],DragonPhase:0b,Rotation:[22.5f,0f]}
execute if score r rng matches 450..899 in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {Tags:["zc_practice_dragon"],DragonPhase:0b,Rotation:[67.5f,0f]}
execute if score r rng matches 900..1349 in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {Tags:["zc_practice_dragon"],DragonPhase:0b,Rotation:[112.5f,0f]}
execute if score r rng matches 1350..1799 in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {Tags:["zc_practice_dragon"],DragonPhase:0b,Rotation:[157.5f,0f]}
execute if score r rng matches 1800..2249 in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {Tags:["zc_practice_dragon"],DragonPhase:0b,Rotation:[202.5f,0f]}
execute if score r rng matches 2250..2699 in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {Tags:["zc_practice_dragon"],DragonPhase:0b,Rotation:[247.5f,0f]}
execute if score r rng matches 2700..3149 in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {Tags:["zc_practice_dragon"],DragonPhase:0b,Rotation:[292.5f,0f]}
execute if score r rng matches 3150..3599 in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {Tags:["zc_practice_dragon"],DragonPhase:0b,Rotation:[337.5f,0f]}
# On Crystal Break: Vanilla needs the fight to tell this dragon about crystals
execute if score crystal_break settings matches 2 run function zeroboard:fight/adopt

execute store result entity @e[type=minecraft:ender_dragon,tag=zc_practice_dragon,limit=1] Rotation[0] float 0.1 run scoreboard players get r rng

# park it on a big absorption pool so damage lands on absorption, not Health.
# health_display reads the drop off the pool and gets hundredths out of it
data modify entity @e[type=minecraft:ender_dragon,tag=zc_practice_dragon,limit=1] AbsorptionAmount set value 2048.0f

# restore the node probes two ticks out, still standing for the dragon's first
# pathfinding tick whichever tick that is
schedule function practice:level/refill_nodes 2t replace

scoreboard players set #sitting_damage100 zc_ctrl 0

scoreboard players set current health 200
scoreboard players set last health 200
