local MP = minetest.get_modpath(minetest.get_current_modname())

dofile(MP.."/crafting.lua")
core.register_mapgen_script(MP.."/spawn.lua")
