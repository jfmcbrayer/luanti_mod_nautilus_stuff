minetest.register_node("nautilus:ice_with_cold_shell", {
	description = "Ice with Cold Shell",
	tiles = {"default_ice.png^cold_shell.png"},
	groups = {cracky = 3, cools_lava = 1, slippery = 3},
	drop = "nautilus:ice_with_cold_shell",
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_node("nautilus:ice_with_big_cold_shell", {
	description = "Ice with Big Cold Shell",
	tiles = {"default_ice.png^big_cold_nautilus.png"},
	groups = {cracky = 3, cools_lava = 1, slippery = 3},
	drop = "nautilus:ice_with_big_cold_shell",
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_craftitem("nautilus:cold_shell", {
                                description = "Frozen Nautilus shell",
                                inventory_image = "cold_shell.png",
                                wield_image = "cold_shell.png"
                                
})
minetest.register_craftitem("nautilus:shell_shard", {
                                description = "Ancient shell shard",
                                inventory_image = "shell_shard.png",
                                wield_image = "shell_shard.png"
})
minetest.register_craftitem("nautilus:big_cold_shell", {
                                description = "Frozen Titan Nautilus shell",
                                inventory_image = "big_cold_nautilus.png",
                                wield_image = "cold_shell.png"
})
minetest.register_craftitem("nautilus:big_nautilus_shell", {
                                description = "Titan Nautilus shell",
                                inventory_image = "big_nautilus.png",
                                wield_image = "big_nautilus.png"
})

minetest.register_craft({
    type = "cooking",
    output = "nautilus:shell_shard",
    recipe = "nautilus:ice_with_cold_shell",
    cooktime = 3.0,
})
minetest.register_craft({
    type = "cooking",
    output = "nautilus:shell_shard",
    recipe = "nautilus:ice_with_cold_shell",
    cooktime = 3.0,
})
minetest.register_craft({
    type = "cooking",
    output = "nautilus:big_nautilus_shell",
    recipe = "nautilus:ice_with_big_cold_shell",
    cooktime = 3.0,
})
