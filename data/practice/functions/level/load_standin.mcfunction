# Natural Terrain off: Mescht's stand-in structures. coming off natural terrain,
# its tiles put his island back first
execute if score #natural_on natural_end matches 1 run function natural_end:restore

# clear stone left over from a taller buried spawn
fill 96 52 -4 104 66 4 minecraft:air replace minecraft:end_stone
setblock 100 42 0 minecraft:structure_block{posX:-22,posY:1,posZ:-15,mode:"LOAD"}

# populate structure block - one structure covers a range of depths, extend_buried
# then digs it out to the exact height
execute if score spawn_act settings matches 0 run data modify block 100 42 0 name set value "practice:spawns/open"
execute if score spawn_act settings matches 1 run data modify block 100 42 0 name set value "practice:spawns/overhang"
execute if score spawn_act settings matches 3..5 run data modify block 100 42 0 name set value "practice:spawns/cage_3"
execute if score spawn_act settings matches 6 run data modify block 100 42 0 name set value "practice:spawns/cage_4"
execute if score spawn_act settings matches 7 run data modify block 100 42 0 name set value "practice:spawns/cage_5"
execute if score spawn_act settings matches 8 run data modify block 100 42 0 name set value "practice:spawns/cage_6"
execute if score spawn_act settings matches 9..17 run data modify block 100 42 0 name set value "practice:spawns/cage_7"

setblock 100 41 0 minecraft:redstone_block
fill 100 41 0 100 42 0 air
function practice:level/extend_buried
