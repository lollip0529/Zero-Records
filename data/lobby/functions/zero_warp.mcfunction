tellraw @s ["",{"text":"\u24d8 ","bold":true,"color":"#77E999"},{"text":"\u2022 ","bold":true,"color":"dark_gray"},{"text":"Loading...","bold":true,"color":"#77E999"}]

function lobby:disable_packs
datapack enable "file/ZeroPractice" after "vanilla"

function lobby:refresh_tags
execute in the_end run tp @a 137 65 0 90 0
execute if score crystal_break settings matches 1 unless entity 6750dc12-58cc-4e09-9d9c-90f50e72f5b0 in minecraft:the_end run summon minecraft:ender_dragon 137 5 0 {UUID:[I;1733352466,1489784329,-1650683659,242415024],Tags:["zc_fight_park"],NoAI:1b,Silent:1b,DragonPhase:0}
scoreboard players set #heal_warp zc_ctrl 1
spawnpoint @p 137 65 0
clear @p

scoreboard players set timer timer 0
scoreboard players set timer settings 0
title @a actionbar ""

title @a times 10 25 10
tellraw @a ["",{"text":"\u24d8 ","bold":true,"color":"#77E999"},{"text":"\u2022 ","bold":true,"color":"dark_gray"},{"text":"Use","color":"#F1EC82"},{"text":" /trigger hub","bold":true,"color":"#77E999"},{"text":" or","color":"#F1EC82"},{"text":" the sign\n \u0020 \u0020","bold":true,"color":"#77E999"},{"text":" to return to","color":"#F1EC82"},{"text":" the hub!","bold":true,"color":"#77E999"}]
title @a subtitle ["",{"text":"\u2505","bold":true,"color":"dark_gray"},{"text":" Zero Practice","bold":true,"color":"#F1EC82"},{"text":" \u2505","bold":true,"color":"dark_gray"}]
title @a title {"text":""}
