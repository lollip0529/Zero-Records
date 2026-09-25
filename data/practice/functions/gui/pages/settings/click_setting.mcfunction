execute if score index gui matches 0..21 if data storage practice:gui pages[1].entries[{active:1b}] run function practice:gui/pages/settings/list_menu
execute if score index gui matches 24 if score settings_page gui matches 1..2 run scoreboard players remove settings_page gui 1
execute if score index gui matches 25 if score settings_page gui matches 0..1 run scoreboard players add settings_page gui 1
execute if score index gui matches 26 if score settings_page gui matches 1 run scoreboard players set settings_page gui 3

execute if score index gui matches 0 run scoreboard players operation location settings = value gui
execute if score index gui matches 1 run scoreboard players operation direction settings = value gui
execute if score index gui matches 2 run scoreboard players operation damage settings = value gui
execute if score index gui matches 3 run scoreboard players operation saturation settings = value gui
execute if score index gui matches 4 run scoreboard players operation spawn settings = value gui
execute if score index gui matches 5 run scoreboard players operation knockback settings = value gui
execute if score index gui matches 6 run scoreboard players operation timer settings = value gui
execute if score index gui matches 7 run scoreboard players operation rotation settings = value gui
execute if score index gui matches 7 run scoreboard objectives setdisplay sidebar
execute if score index gui matches 7 if score rotation settings matches 3 run scoreboard objectives setdisplay sidebar custom_rotation
execute if score index gui matches 8 run scoreboard players operation randomize settings = value gui
execute if score index gui matches 9 run scoreboard players operation iframe settings = value gui
execute if score index gui matches 10 run scoreboard players operation show_nodes settings = value gui
execute if score index gui matches 11 run scoreboard players operation pearl_tracker settings = value gui
execute if score index gui matches 12 run scoreboard players operation fireres settings = value gui
execute if score index gui matches 13 run scoreboard players operation disable_dragon settings = value gui
execute if score index gui matches 14 run scoreboard players operation fly_chance settings = value gui
execute if score index gui matches 15 run scoreboard players operation crystal_break settings = value gui
execute if score index gui matches 16 run scoreboard players operation fireball_chance settings = value gui
execute if score index gui matches 17 run scoreboard players operation timing_tracker settings = value gui
execute if score index gui matches 19 run scoreboard players operation vanilla_entry settings = value gui
execute if score index gui matches 20 run scoreboard players operation natural_terrain settings = value gui
execute if score index gui matches 21 run scoreboard players operation abandon_info settings = value gui
