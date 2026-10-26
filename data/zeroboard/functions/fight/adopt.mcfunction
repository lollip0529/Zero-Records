# the fight only tells one dragon about broken crystals: the one whose UUID it saved,
# and Mescht's 1.2.2 level.dat saved this one. swap it in before its first tick so
# the flight is the same. if the summon fails the fresh dragon stays
execute in minecraft:the_end run summon minecraft:ender_dragon 0.0 128 0.0 {UUID:[I;1733352466,1489784329,-1650683659,242415024],Tags:["zc_fight_new"],DragonPhase:0b}
execute if entity @e[type=minecraft:ender_dragon,tag=zc_fight_new] run kill @e[type=minecraft:ender_dragon,tag=zc_practice_dragon]
tag @e[type=minecraft:ender_dragon,tag=zc_fight_new] add zc_practice_dragon
tag @e[type=minecraft:ender_dragon,tag=zc_fight_new] remove zc_fight_new
