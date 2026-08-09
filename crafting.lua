minetest.register_node("nautilus:ice_with_cold_shell", {
	description = "Ice with Cold Shell",
	tiles = {"default_ice.png^cold_shell.png"},
	groups = {cracky = 3, cools_lava = 1, slippery = 3},
	drop = "nautilus:cold_shell",
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_craftitem("nautilus:cold_shell", {
                                description = "Frozen Nautilus shell",
                                inventory_image = "cold_shell.png",
                                wield_image = "cold_shell.png"
                                
})
