# confirm at fountain arrival or collision and add the death animation up front. the
# timer already counted this tick, so 199 more lands on the tick the dragon is removed,
# same as the base pack. the missing-dragon fallback has already lived through that tail.
execute if entity @e[type=minecraft:ender_dragon,limit=1] run scoreboard players add timer timer 199
scoreboard players set active timer 0
# keeps prediction/lock out of the post-confirm window; cleared when the next
# kill saves its record
scoreboard players set #finish_locked zc_ctrl 1
execute unless score onecycle flags matches 1 run function zeroboard:records/finish

function practice:timer/timer

# flying_to_fountain deliberately stays set through the death animation so
# health_display keeps fountain-flight mode (bossbar empty, pool untouched);
# practice:reset clears it with the rest of the attempt

execute if score timer settings matches 0 unless score onecycle flags matches 1 run tellraw @a [{"text":"\nFinal Time: "},{"nbt":"time_string","storage":"practice:timeparser","interpret":true,"color":"gold"}]
