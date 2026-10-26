# kill on the fight's dragon rebuilds the exit portal over the fountain. a tp to
# another dimension leaves a copy there and drops the original without asking the fight
# an empty overworld stops ticking and would keep the killed copy on the UUID, ahead
# of the End's dragon next time. a forced chunk keeps it ticking until the copy is gone
execute in minecraft:overworld run forceload add 536 536
execute in minecraft:overworld run tp 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 536 250 536
execute as 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 if entity @s[x=535,y=249,z=535,dx=2,dy=2,dz=2] run kill @s
schedule function zeroboard:fight/unload 5t replace
scoreboard players set #fight_death zc_ctrl 0
