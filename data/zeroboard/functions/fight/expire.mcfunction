# its 200th death tick would hand the fight its dragon and rebuild the exit portal.
# end it here instead, on that same tick, with the xp that tick pays: 40 before the
# last 0.1 rise and 100 after (500 base, the map's fight was killed before)
execute store result score #mob_loot zc_ctrl run gamerule doMobLoot
execute if score #mob_loot zc_ctrl matches 1 at 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run summon minecraft:experience_orb ~ ~ ~ {Value:37s}
execute if score #mob_loot zc_ctrl matches 1 at 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run summon minecraft:experience_orb ~ ~ ~ {Value:3s}
execute if score #mob_loot zc_ctrl matches 1 at 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run summon minecraft:experience_orb ~ ~0.1 ~ {Value:73s}
execute if score #mob_loot zc_ctrl matches 1 at 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run summon minecraft:experience_orb ~ ~0.1 ~ {Value:17s}
execute if score #mob_loot zc_ctrl matches 1 at 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run summon minecraft:experience_orb ~ ~0.1 ~ {Value:7s}
execute if score #mob_loot zc_ctrl matches 1 at 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 run summon minecraft:experience_orb ~ ~0.1 ~ {Value:3s}
function zeroboard:fight/remove
