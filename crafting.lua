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

core.register_node("nautilus_stuff:dry_ice", {
    description = "Dry ice",
    tiles = { "default_ice.png^[opacity:238^[brighten"},
    drawtype = "glasstype",
    use_texture_alpha = "blend",
    groups = {oddly_breakable_by_hand = 3, cracky = 1, slippery = 1},
    paramtype = "light",
    drop = { max_items = 0},
    sounds = default.node_sound_ice_defaults(),
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
rebreather = function(itemstack, user, pointed_thing)
    if user and user:get_breath() < 10 then
        user:set_breath(10)
    end
    return itemstack
end

core.register_tool("nautilus_stuff:nautilus_trident", {
        description = "Nautilus Trident",
        inventory_image = "nautilus_trident.png",
        wield_image = "nautilus_trident.png",
        wield_scale = {x = 1, y = 2.25, z = 1.25},
        stack_max = 1,
        range = 8.0,
        tool_capabilities = {
            full_punch_interval = 0.7,
            max_drop_level = 1,
            groupcaps = {
		crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=360, maxlevel=3},
            },
            damage_groups = {fleshy = 12},
            punch_attack_uses = 360,
        },
        on_place = rebreather,
        on_secondary_use = rebreather
})

ice_if_eligible = function(pos, user)
    if core.get_node(pos).name == "air" and not core.is_protected(pos, user:get_player_name()) then
        core.set_node(pos, {name = "nautilus_stuff:dry_ice"})
    end
end

ice_shell = function(itemstack, user, pointed_thing)
    local pos = vector.round(user:get_pos())
    user:set_pos(pos)

    for dx = -1, 1 do
        for dz = -1, 1 do
            if (math.abs(dx) == 1 and dz == 0) or (math.abs(dz) == 1 and dx == 0) then
                local ipos = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
                ice_if_eligible(ipos, user)
                local ipos2 = {x=pos.x+dx, y=pos.y + 1, z=pos.z+dz}
                ice_if_eligible(ipos2, user)
            end
        end
    end
    local cap = {x=pos.x, y=pos.y + 2, z=pos.z}
    ice_if_eligible(cap, user)

    return itemstack
end

core.register_tool("nautilus_stuff:nautilus_mace", {
                       description = "Nautilus Mace",
                       inventory_image = "nautilus_mace.png",
                       wield_image = "nautilus_mace.png",
                       wield_scale = {x = 2.25, y = 1.75, z = 1.75},
                       stack_max = 1,
                       tool_capabilities = {
                           full_punch_interval = 0.7,
                           max_drop_level = 1,
                           groupcaps = {
                               cracky = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=360, maxlevel=3},
                           },
                           damage_groups = { fleshy = 15 },
                           punch_attack_uses = 360,
                       },
                       on_place = ice_shell,
                       on_secondary_use = ice_shell
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
