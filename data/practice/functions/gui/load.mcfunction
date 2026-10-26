function practice:gui/pages/home/build_view

data modify storage practice:gui src set from storage practice:gui pages[1].entries
function practice:gui/dedupe
data modify storage practice:gui pages[1].entries set from storage practice:gui clean
data modify storage practice:gui src set from storage practice:gui pages[1].defaults
function practice:gui/dedupe
data modify storage practice:gui pages[1].defaults set from storage practice:gui clean

# 2-state settings glint while on. the base lists On first, so on is value 0 for
# all of them except Vanilla End Entry. the filter form of data modify appends a
# bare copy of the filter when nothing matches, so only touch entries that exist
data remove storage practice:gui pages[1].entries[].tag.Enchantments
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:2b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:2b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:5b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:5b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:6b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:6b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:9b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:9b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:12b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:12b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:13b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:13b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:16b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:16b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:17b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:17b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:20b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:20b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:0b,tag:{index:21b}}] run data modify storage practice:gui pages[1].entries[{value:0b,tag:{index:21b}}].tag.Enchantments set value [{}]
execute if data storage practice:gui pages[1].entries[{value:1b,tag:{index:19b}}] run data modify storage practice:gui pages[1].entries[{value:1b,tag:{index:19b}}].tag.Enchantments set value [{}]

execute in minecraft:the_end run data modify block 133 66 -1 Items set from storage practice:gui tower_view
function practice:gui/pages/settings/build_view
execute in minecraft:the_end run data modify block 133 66 1 Items set from storage practice:gui settings_view
