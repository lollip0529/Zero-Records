# dying dragons ignore kill; fresh UUIDs let the next attempt spawn before they despawn.
# the fight's own dragon goes first, alive or dying: kill would rebuild the exit portal
execute if entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run function zeroboard:fight/remove
execute in minecraft:the_end run kill @e[type=minecraft:ender_dragon]
