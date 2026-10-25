# the patch runs past a low render distance from the lobby, and fill and
# setblock both refuse unloaded chunks
forceload add 62 -49 173 48
# o64 is the only spawn that reaches past the patch; #o64 says its continuation
# is still out there. that area is only redone when switching to or from o64
execute if score #spawn natural_end matches 15 run forceload add 62 -97 173 143
execute if score #o64 natural_end matches 1 run forceload add 62 -97 173 143

# the tiles carry air for everything any spawn can fill, so switching spawns only
# touches blocks that differ. the old full clear is only needed once, for
# whatever an older version left in the world
execute unless score #clean natural_end matches 1 run function natural_end:clear_patch
scoreboard players set #clean natural_end 1
execute if score #spawn natural_end matches 15 unless score #o64 natural_end matches 1 run function natural_end:clear_o64_extension
execute unless score #spawn natural_end matches 15 if score #o64 natural_end matches 1 run function natural_end:clear_o64_extension
execute unless score #spawn natural_end matches 15 if score #o64 natural_end matches 1 run function natural_end:load/base_extension
scoreboard players set #o64 natural_end 0
execute if score #spawn natural_end matches 15 run scoreboard players set #o64 natural_end 1

execute if score #spawn natural_end matches 0 run function natural_end:load/open
execute if score #spawn natural_end matches 1 run function natural_end:load/overhang
execute if score #spawn natural_end matches 3 run function natural_end:load/buried_52
execute if score #spawn natural_end matches 4 run function natural_end:load/buried_53
execute if score #spawn natural_end matches 5 run function natural_end:load/buried_54
execute if score #spawn natural_end matches 6 run function natural_end:load/buried_55
execute if score #spawn natural_end matches 7 run function natural_end:load/buried_56
execute if score #spawn natural_end matches 8 run function natural_end:load/buried_57
execute if score #spawn natural_end matches 9 run function natural_end:load/buried_58
execute if score #spawn natural_end matches 10 run function natural_end:load/buried_59
execute if score #spawn natural_end matches 11 run function natural_end:load/buried_60
execute if score #spawn natural_end matches 12 run function natural_end:load/buried_61
execute if score #spawn natural_end matches 13 run function natural_end:load/buried_62
execute if score #spawn natural_end matches 14 run function natural_end:load/buried_63
execute if score #spawn natural_end matches 15 run function natural_end:load/buried_64
execute if score #spawn natural_end matches 15 run function natural_end:load/buried_64_extension
execute if score #spawn natural_end matches 16 run function natural_end:load/buried_65
execute if score #spawn natural_end matches 17 run function natural_end:load/buried_66

# terrain structures put end stone in the spawn footprint, so restore Zero's platform last
function natural_end:restore_spawn_platform

forceload remove 62 -97 173 143
