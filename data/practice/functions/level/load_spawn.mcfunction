# spawn list went 9 -> 21 entries. menu order is
#   0 Natural Distribution   1 Uniformly Random   2 Random Buried   3 Custom
#   4 Open   5 Overhang   6..20 Buried 52..66
# but spawn_act keeps the base pack's numbering, so 4 and 5 are mapped back and the
# buried entries are shifted down by 3 to land on spawn_act 3..17.
scoreboard players operation spawn_act settings = spawn settings
execute if score spawn settings matches 4 run scoreboard players set spawn_act settings 0
execute if score spawn settings matches 5 run scoreboard players set spawn_act settings 1
execute if score spawn settings matches 6..20 run scoreboard players remove spawn_act settings 3

# natural distribution - weighted to match how often each spawn occurs in real seeds
execute if score spawn settings matches 0 run scoreboard players set mod rng 10000
execute if score spawn settings matches 0 run function practice:random/generate
execute if score spawn settings matches 0 run scoreboard players operation #spawn_roll settings = r rng
execute if score spawn settings matches 0 if score #spawn_roll settings matches 0..39 run scoreboard players set spawn_act settings 3
execute if score spawn settings matches 0 if score #spawn_roll settings matches 40..109 run scoreboard players set spawn_act settings 4
execute if score spawn settings matches 0 if score #spawn_roll settings matches 110..179 run scoreboard players set spawn_act settings 5
execute if score spawn settings matches 0 if score #spawn_roll settings matches 180..249 run scoreboard players set spawn_act settings 6
execute if score spawn settings matches 0 if score #spawn_roll settings matches 250..1179 run scoreboard players set spawn_act settings 7
execute if score spawn settings matches 0 if score #spawn_roll settings matches 1180..2089 run scoreboard players set spawn_act settings 8
execute if score spawn settings matches 0 if score #spawn_roll settings matches 2090..2579 run scoreboard players set spawn_act settings 9
execute if score spawn settings matches 0 if score #spawn_roll settings matches 2580..2779 run scoreboard players set spawn_act settings 10
execute if score spawn settings matches 0 if score #spawn_roll settings matches 2780..2859 run function practice:level/load_random_high_cage
execute if score spawn settings matches 0 if score #spawn_roll settings matches 2860..6429 run scoreboard players set spawn_act settings 0
execute if score spawn settings matches 0 if score #spawn_roll settings matches 6430..9999 run scoreboard players set spawn_act settings 1

# uniformly random - flat roll over every spawn, ignoring how common it is
execute if score spawn settings matches 1 run scoreboard players set mod rng 17
execute if score spawn settings matches 1 run function practice:random/generate
execute if score spawn settings matches 1 run scoreboard players operation spawn_act settings = r rng
execute if score spawn settings matches 1 if score spawn_act settings matches 2..16 run scoreboard players add spawn_act settings 1

# custom - flat roll over the spawns ticked on the settings chest's spawn pool page
execute if score spawn settings matches 3 run function practice:level/choose_spawn_pool

execute if score spawn_act settings matches 2 run function practice:level/load_random_cage

# natural_end's tiles also wipe the box Mescht's spawn structure used to reset
execute if score natural_terrain settings matches 0 run function natural_end:apply
execute unless score natural_terrain settings matches 0 run function practice:level/load_standin
