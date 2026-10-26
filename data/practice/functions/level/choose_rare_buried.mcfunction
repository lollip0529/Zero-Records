# natural distribution's 1-in-10,000 bucket. each roll keeps the next height:
#   o62 ~1 in 10,500   o63 ~1 in 204,000   o64 ~1 in 10 million
#   o65 ~1 in 859 million   o66 ~1 in 570 billion
scoreboard players set spawn_act settings 13
scoreboard players set mod rng 20
function practice:random/generate
execute if score r rng matches 0 run scoreboard players set spawn_act settings 14
scoreboard players set mod rng 50
function practice:random/generate
execute if score spawn_act settings matches 14 if score r rng matches 0 run scoreboard players set spawn_act settings 15
scoreboard players set mod rng 429
function practice:random/generate
execute if score spawn_act settings matches 15 if score r rng matches 0..4 run scoreboard players set spawn_act settings 16
scoreboard players set mod rng 664
function practice:random/generate
execute if score spawn_act settings matches 16 if score r rng matches 0 run scoreboard players set spawn_act settings 17
