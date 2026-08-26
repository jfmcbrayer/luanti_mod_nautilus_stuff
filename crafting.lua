-- Nodes and craft items 
-----------------------------------------------------------
-- Nodes
core.register_node("nautilus_stuff:ice_with_cold_shell", {
	description = "Ice with Frozen Nautilus Shell",
	tiles = {"default_ice.png^cold_shell.png"},
	groups = {cracky = 3, cools_lava = 1, slippery = 3},
	drop = "nautilus_stuff:ice_with_cold_shell",
        paramtype = "light",
	sounds = default.node_sound_ice_defaults(),
})

core.register_node("nautilus_stuff:ice_with_big_cold_shell", {
	description = "Ice with Frozen Titan Nautilus Shell",
	tiles = {"default_ice.png^big_cold_nautilus.png"},
	groups = {cracky = 3, cools_lava = 1, slippery = 3},
	drop = "nautilus_stuff:ice_with_big_cold_shell",
        paramtype = "light",
	sounds = default.node_sound_ice_defaults(),
})

core.register_node("nautilus_stuff:nautilus_block", {
                       description = "Nautilus block",
                       tiles = {"nautilus_block.png"},
                       groups = {cracky = 3},
                       paramtype = "light"
})

-- Craft items 
core.register_craftitem("nautilus_stuff:cold_shell", {
                                description = "Frozen Nautilus shell",
                                inventory_image = "cold_shell.png",
                                wield_image = "cold_shell.png"
                                
})
core.register_craftitem("nautilus_stuff:shell_shard", {
                                description = "Ancient shell shard",
                                inventory_image = "shell_shard.png",
                                wield_image = "shell_shard.png"
})
core.register_craftitem("nautilus_stuff:big_cold_shell", {
                                description = "Frozen Titan Nautilus shell",
                                inventory_image = "big_cold_nautilus.png",
                                wield_image = "big_cold_nautilus.png"
})
core.register_craftitem("nautilus_stuff:big_nautilus_shell", {
                                description = "Titan Nautilus shell",
                                inventory_image = "big_nautilus.png",
                                wield_image = "big_nautilus.png"
})

-- Tools
core.register_tool("nautilus_stuff:nautilus_trident", {
        description = "Nautilus Trident",
        inventory_image = "nautilus_trident.png",
        wield_image = "nautilus_trident.png",
        wield_scale = {x = 1, y = 2, z = 1},
        stack_max = 1,
        range = 8.0,
        tool_capabilities = {
            full_punch_interval = 0.7,
            max_drop_level = 1,
            groupcaps = {
		crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=360, maxlevel=3},
            },
            damage_groups = {fleshy = 12},
            punch_attack_uses = 720,
        },
        on_place = function(itemstack, user, pointed_thing)
		if user and user:get_breath() < 10 then user:set_breath(10) end
	end
})

core.register_tool("nautilus_stuff:nautilus_mace", {
                       description = "Nautilus Mace",
                       inventory_image = "nautilus_mace.png",
                       wield_image = "nautilus_mace.png",
                       stack_max = 1,
                       tool_capabilities = {
                           full_punch_interval = 0.7,
                           max_drop_level = 1,
                           groupcaps = {
                               cracky = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=360, maxlevel=3},
                           },
                           damage_groups = { fleshy = 15 },
                           punch_attack_uses = 720,
                       },
})

-- Recipes
core.register_craft({
    type = "cooking",
    output = "nautilus_stuff:shell_shard",
    recipe = "nautilus_stuff:ice_with_cold_shell",
    cooktime = 3.0,
})
core.register_craft({
    type = "cooking",
    output = "nautilus_stuff:shell_shard",
    recipe = "nautilus_stuff:ice_with_cold_shell",
    cooktime = 3.0,
})
core.register_craft({
    type = "cooking",
    output = "nautilus_stuff:big_nautilus_shell",
    recipe = "nautilus_stuff:ice_with_big_cold_shell",
    cooktime = 3.0,
})

core.register_craft({
        output = "nautilus_stuff:nautilus_block",
        recipe = {
            {"nautilus_stuff:big_nautilus_shell", "nautilus_stuff:big_nautilus_shell", "nautilus_stuff:big_nautilus_shell"},
            {"nautilus_stuff:big_nautilus_shell", "nautilus_stuff:big_nautilus_shell", "nautilus_stuff:big_nautilus_shell"},
            {"nautilus_stuff:big_nautilus_shell", "nautilus_stuff:big_nautilus_shell", "nautilus_stuff:big_nautilus_shell"},
        }
})

core.register_craft({
        output = "nautilus_stuff:nautilus_trident",
        recipe = {
            {"", "nautilus_stuff:shell_shard", "nautilus_stuff:shell_shard"},
            {"", "default:obsidian_shard", "nautilus_stuff:shell_shard"},
            {"nautilus_stuff:big_nautilus_shell", "", ""},
        }
})

core.register_craft({
        output = "nautilus_stuff:nautilus_mace",
        recipe = {
            {"nautilus_stuff:big_nautilus_shell", "nautilus_stuff:nautilus_block", "nautilus_stuff:big_nautilus_shell"},
            {"",                            "default:obsidian_shard",  ""},
            {"",                            "nautilus_stuff:shell_shard",    ""},
        }
})
