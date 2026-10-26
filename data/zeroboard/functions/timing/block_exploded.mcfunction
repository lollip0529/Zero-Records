execute if score timing_tracker settings matches 0 unless score in_lobby flags matches 1 if entity @s[tag=zc_aim_anchor] run tellraw @a [{"nbt":"time_string","storage":"practice:timeparser","interpret":true},{"text":" Anchor Exploded","color":"white"}]
execute if score timing_tracker settings matches 0 unless score in_lobby flags matches 1 unless entity @s[tag=zc_aim_anchor] run tellraw @a [{"nbt":"time_string","storage":"practice:timeparser","interpret":true},{"text":" Bed Exploded","color":"white"}]
advancement revoke @s only zeroboard:block_exploded
