# a kill mid prediction has to resolve now, there is no later
execute if score #prediction_active zc_ctrl matches 1 in minecraft:the_end run function zeroboard:prediction/force_finish
scoreboard players operation #prediction_pb_before zc_ctrl = #pb_ticks zc_ctrl
data modify storage zeroboard:records current set value {id:0,standing:0,base:0,plus:0,type:"Other",tower:0,approach:"Unknown",approach_code:-1,angle:-1,speed:-1,cover:-1,buried:-1,spawn:"Unknown",pickaxe_code:0,pickaxe:"None",death_ticks:0,finish_ticks:0,finish_actual:0b,finish_source:0,predicted_flight_ticks:0,prediction_guard:0,prediction_pending:0b,prediction_ready:0b,prediction_announced:0b,pb_before_ticks:0,show_time:0b,arrival_ticks:0,actual_flight_ticks:0,flight_error:0,death_tail_ticks:0,observed_finish_ticks:0,finish_observation_error:0}
scoreboard players add #next_id zc_ctrl 1
scoreboard players operation #active_record zc_ctrl = #next_id zc_ctrl
scoreboard players set #finish_locked zc_ctrl 0
execute store result storage zeroboard:records current.id int 1 run scoreboard players get #next_id zc_ctrl
execute store result storage zeroboard:records current.standing int 1 run scoreboard players get height stats
execute store result storage zeroboard:records current.base int 1 run scoreboard players get explosives stats
execute store result storage zeroboard:records current.plus int 1 run scoreboard players get plus_1 stats
execute store result storage zeroboard:records current.death_ticks int 1 run scoreboard players get timer timer
execute store result storage zeroboard:records current.pb_before_ticks int 1 run scoreboard players get #prediction_pb_before zc_ctrl
execute if score timer settings matches 0 run data modify storage zeroboard:records current.show_time set value 1b

function zeroboard:records/type

execute if score tower settings matches 0 run data modify storage zeroboard:records current.tower set value 76
execute if score tower settings matches 1 run data modify storage zeroboard:records current.tower set value 79
execute if score tower settings matches 2 run data modify storage zeroboard:records current.tower set value 82
execute if score tower settings matches 3 run data modify storage zeroboard:records current.tower set value 85
execute if score tower settings matches 4 run data modify storage zeroboard:records current.tower set value 88
execute if score tower settings matches 5 run data modify storage zeroboard:records current.tower set value 91
execute if score tower settings matches 6 run data modify storage zeroboard:records current.tower set value 94
execute if score tower settings matches 7 run data modify storage zeroboard:records current.tower set value 97
execute if score tower settings matches 8 run data modify storage zeroboard:records current.tower set value 100
execute if score tower settings matches 9 run data modify storage zeroboard:records current.tower set value 103

function zeroboard:records/approach
execute store result storage zeroboard:records current.approach_code int 1 run scoreboard players get #approach zc_ctrl
data modify storage zeroboard:records current.approach set from storage zeroboard:records work.approach
execute store result storage zeroboard:records current.angle int 1 run scoreboard players get angle_act settings
execute store result storage zeroboard:records current.speed int 1 run scoreboard players get speed_act settings

execute if score spawn_act settings matches 0 run data modify storage zeroboard:records current merge value {cover:0,buried:-1,spawn:"Open"}
execute if score spawn_act settings matches 1 run data modify storage zeroboard:records current merge value {cover:1,buried:-1,spawn:"Overhang"}
execute if score spawn_act settings matches 3 run data modify storage zeroboard:records current merge value {cover:2,buried:52,spawn:"O52"}
execute if score spawn_act settings matches 4 run data modify storage zeroboard:records current merge value {cover:2,buried:53,spawn:"O53"}
execute if score spawn_act settings matches 5 run data modify storage zeroboard:records current merge value {cover:2,buried:54,spawn:"O54"}
execute if score spawn_act settings matches 6 run data modify storage zeroboard:records current merge value {cover:2,buried:55,spawn:"O55"}
execute if score spawn_act settings matches 7 run data modify storage zeroboard:records current merge value {cover:2,buried:56,spawn:"O56"}
execute if score spawn_act settings matches 8 run data modify storage zeroboard:records current merge value {cover:2,buried:57,spawn:"O57"}
execute if score spawn_act settings matches 9 run data modify storage zeroboard:records current merge value {cover:2,buried:58,spawn:"O58"}
execute if score spawn_act settings matches 10 run data modify storage zeroboard:records current merge value {cover:2,buried:59,spawn:"O59"}
execute if score spawn_act settings matches 11 run data modify storage zeroboard:records current merge value {cover:2,buried:60,spawn:"O60"}
execute if score spawn_act settings matches 12 run data modify storage zeroboard:records current merge value {cover:2,buried:61,spawn:"O61"}
execute if score spawn_act settings matches 13 run data modify storage zeroboard:records current merge value {cover:2,buried:62,spawn:"O62"}
execute if score spawn_act settings matches 14 run data modify storage zeroboard:records current merge value {cover:2,buried:63,spawn:"O63"}
execute if score spawn_act settings matches 15 run data modify storage zeroboard:records current merge value {cover:2,buried:64,spawn:"O64"}
execute if score spawn_act settings matches 16 run data modify storage zeroboard:records current merge value {cover:2,buried:65,spawn:"O65"}
execute if score spawn_act settings matches 17 run data modify storage zeroboard:records current merge value {cover:2,buried:66,spawn:"O66"}

# pickaxe, first match wins - gold beats netherite on purpose
execute if entity @a[nbt={Inventory:[{id:"minecraft:golden_pickaxe"}]}] run data modify storage zeroboard:records current merge value {pickaxe_code:5,pickaxe:"Gold"}
execute if data storage zeroboard:records current{pickaxe_code:0} if entity @a[nbt={Inventory:[{id:"minecraft:netherite_pickaxe"}]}] run data modify storage zeroboard:records current merge value {pickaxe_code:4,pickaxe:"Netherite"}
execute if data storage zeroboard:records current{pickaxe_code:0} if entity @a[nbt={Inventory:[{id:"minecraft:diamond_pickaxe"}]}] run data modify storage zeroboard:records current merge value {pickaxe_code:3,pickaxe:"Diamond"}
execute if data storage zeroboard:records current{pickaxe_code:0} if entity @a[nbt={Inventory:[{id:"minecraft:iron_pickaxe"}]}] run data modify storage zeroboard:records current merge value {pickaxe_code:2,pickaxe:"Iron"}
execute if data storage zeroboard:records current{pickaxe_code:0} if entity @a[nbt={Inventory:[{id:"minecraft:stone_pickaxe"}]}] run data modify storage zeroboard:records current merge value {pickaxe_code:1,pickaxe:"Stone"}
execute if data storage zeroboard:records current{pickaxe_code:0} if entity @a[nbt={Inventory:[{id:"minecraft:wooden_pickaxe"}]}] run data modify storage zeroboard:records current merge value {pickaxe_code:6,pickaxe:"Wood"}
execute if data storage zeroboard:records current{cover:2,pickaxe_code:0} run data modify storage zeroboard:records current.pickaxe set value "Fist"

data modify storage zeroboard:records records prepend from storage zeroboard:records current
function zeroboard:prediction/predict

scoreboard players set #dirty zc_ctrl 1
