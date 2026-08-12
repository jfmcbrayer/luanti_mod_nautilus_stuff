minetest.register_decoration({
        deco_type = "simple",
        place_on = {"default:ice", "default:cave_ice", "default:snow",
                    "default:snowblock", "default:dirt_with_snow",
                    "default:permafrost_with_stones",
                    "default:permafrost_with_moss"},
        sidelen = 16,
        fill_ratio = 0.002,
        place_offset_y=-1,
        flags = "place_center_z,place_center_x,force_placement",
        -- biomes = {"icesheet", "icesheet_ocean", "icesheet_under", "tundra", "tundra_highland", "tundra_under", "tundra_beach", "tundra_ocean", "taiga", "taiga_under", "taiga_ocean", "snowy_grassland", "snowy_grassland_under", "snowy_grassland_ocean"},
        y_min = -31000,
        y_max = 31000,
        decoration = "nautilus:ice_with_cold_shell"
})

minetest.register_decoration({
        deco_type = "simple",
        place_on = {"default:ice", "default:cave_ice", "default:snow",
                    "default:snowblock", "default:dirt_with_snow",
                    "default:permafrost_with_stones",
                    "default:permafrost_with_moss"},
        sidelen = 16,
        fill_ratio = 0.001,
        place_offset_y=-1,
        flags = "place_center_z,place_center_x,force_placement",
        -- biomes = {"icesheet", "icesheet_ocean", "icesheet_under", "tundra", "tundra_highland", "tundra_under", "tundra_beach", "tundra_ocean", "taiga", "taiga_under", "taiga_ocean", "snowy_grassland", "snowy_grassland_under", "snowy_grassland_ocean"},
        y_min = -31000,
        y_max = 31000,
        decoration = "nautilus:ice_with_big_cold_shell"
})
