core.register_on_generated(function(vmanip, minp, maxp, blockseed)
        local vmanip2 = core.get_mapgen_object("voxelmanip")
        local data = vmanip2:get_data()
        local c_ice = core.get_content_id("default:ice")
        local c_cice = core.get_content_id("default:cave_ice")
        local c_shell = core.get_content_id("nautilus:ice_with_cold_shell")
        local c_big_shell = core.get_content_id("nautilus:ice_with_big_cold_shell")

        local min, max = vmanip2:get_emerged_area()
        local area = VoxelArea:new{
            MinEdge = min,
            MaxEdge = max
        }

        for z = min.z, max.z do
            for y = min.y, max.y do
                for x = min.x, max.x do
                    -- vi, voxel index, is a common variable name here
                    local vi = area:index(x, y, z)
                    if data[vi] == c_ice or data[vi] == c_cice then
                        local rv = math.random()
                        -- core.debug("rv is", rv)
                        if rv <= 0.002 then
                            data[vi] = c_big_shell
                            core.debug("big shell placed at", x, y, z)
                        elseif rv <= 0.008 then
                            data[vi] = c_shell
                            core.debug("small shell placed at", x, y, z)
                        end
                    end
                end
            end
        end
        vmanip2:set_data(data)
end)
