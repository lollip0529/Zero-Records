tellraw @a {"text":"Crystal Destroyed","color":"red"}
execute if score timing_tracker settings matches 0 run tellraw @a [{"nbt":"time_string","storage":"practice:timeparser","interpret":true},{"text":" Crystal Exploded","color":"white"}]
function practice:crystal_break/apply
