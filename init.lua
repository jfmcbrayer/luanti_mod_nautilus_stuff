local MP = minetest.get_modpath(minetest.get_current_modname())

--dofile(MP.."/items.lua")
--dofile(MP.."/nodes.lua")
--dofile(MP.."/ores.lua")
--dofile(MP.."/tools.lua")
dofile(MP.."/crafting.lua")
core.register_mapgen_script(MP.."/spawn.lua")
