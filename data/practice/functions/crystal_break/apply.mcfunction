execute if score crystal_break settings matches 0 run function practice:crystal_break/no_fly
execute if score crystal_break settings matches 1 run tellraw @a[tag=debug] {"text":"[DEBUG] Crystal break left Vanilla behavior unchanged","color":"dark_purple"}
