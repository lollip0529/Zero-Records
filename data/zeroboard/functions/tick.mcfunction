function zeroboard:fight/tick
execute in minecraft:the_end if score #prediction_active zc_ctrl matches 1 run function zeroboard:prediction/tick

# lobby upkeep only matters while someone is near the board
execute in minecraft:the_end if entity @a[x=120,y=50,z=-20,dx=40,dy=40,dz=40] run function zeroboard:lobby/check

execute if score in_lobby flags matches 1 if score #dirty zc_ctrl matches 1 in minecraft:the_end run function zeroboard:filter/apply
execute if score in_lobby flags matches 1 as @a[scores={zc_menu=1..}] at @s run function zeroboard:menu/click

# menu items are display-only, so sweep up any that got dropped
execute in minecraft:the_end positioned 139 65 0 run kill @e[type=minecraft:item,distance=..12,nbt={Item:{tag:{zeroboard_menu:1b}}}]
