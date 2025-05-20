-- Generates a conical pine tree with dense foliage
local function generate_conical_pine_dense(pos, height)
    local trunk_height = height
    local base_radius = math.floor(height / 5)
    local leaves_start_height = 3

    -- Generate trunk
    for y = -1, trunk_height - 1 do
        minetest.set_node({x = pos.x, y = pos.y + y, z = pos.z}, {name = "default:pine_tree"})
    end

    -- Generate dense leaves
    for y = leaves_start_height, trunk_height - 1 do
        local radius = base_radius - math.floor((base_radius * (y - leaves_start_height)) / (trunk_height - leaves_start_height))
        for x = -radius, radius do
            for z = -radius, radius do
                if x * x + z * z <= radius * radius and not (x == 0 and z == 0) then
                    minetest.set_node({x = pos.x + x, y = pos.y + y, z = pos.z + z}, {name = "default:pine_needles"})
                end
            end
        end
    end

    -- Tree top
    minetest.set_node({x = pos.x, y = pos.y + trunk_height, z = pos.z}, {name = "default:pine_needles"})
end

-- Generates a conical pine tree with spaced foliage
local function generate_conical_pine_spaced(pos, height)
    local trunk_height = height
    local base_radius = math.floor(height / 5)
    local leaves_start_height = 3

    -- Generate trunk
    for y = -1, trunk_height - 1 do
        minetest.set_node({x = pos.x, y = pos.y + y, z = pos.z}, {name = "default:pine_tree"})
    end

    -- Generate spaced leaves
    for y = leaves_start_height, trunk_height - 1 do
        if y % 2 == 0 then
            local radius = base_radius - math.floor((base_radius * (y - leaves_start_height)) / (trunk_height - leaves_start_height))
            for x = -radius, radius do
                for z = -radius, radius do
                    if x * x + z * z <= radius * radius and not (x == 0 and z == 0) then
                        minetest.set_node({x = pos.x + x, y = pos.y + y, z = pos.z + z}, {name = "default:pine_needles"})
                    end
                end
            end
        end
    end

    -- Tree top
    minetest.set_node({x = pos.x, y = pos.y + trunk_height, z = pos.z}, {name = "default:pine_needles"})
end

-- Register dense pine block
local function register_conical_pine_dense_block(name, description, texture, tree_height)
    minetest.register_node(name, {
        description = description,
        tiles = {texture},
        groups = {cracky = 3, stone = 1},
        on_construct = function(pos)
            generate_conical_pine_dense(pos, tree_height)
        end
    })
end

-- Register spaced pine block
local function register_conical_pine_spaced_block(name, description, texture, tree_height)
    minetest.register_node(name, {
        description = description,
        tiles = {texture},
        groups = {cracky = 3, stone = 1},
        on_construct = function(pos)
            generate_conical_pine_spaced(pos, tree_height)
        end
    })
end

-- Dense trees
register_conical_pine_dense_block("pine_generator:conical_pine_dense_15", "Conical Pine Dense - 15 Blocks", "default_pine_tree.png^default_pine_sapling.png", 15)
register_conical_pine_dense_block("pine_generator:conical_pine_dense_18", "Conical Pine Dense - 18 Blocks", "default_pine_tree.png^default_pine_sapling.png", 18)
register_conical_pine_dense_block("pine_generator:conical_pine_dense_22", "Conical Pine Dense - 22 Blocks", "default_pine_tree.png^default_pine_sapling.png", 22)
register_conical_pine_dense_block("pine_generator:conical_pine_dense_28", "Conical Pine Dense - 28 Blocks", "default_pine_tree.png^default_pine_sapling.png", 28)

-- Spaced trees
register_conical_pine_spaced_block("pine_generator:conical_pine_spaced_15", "Conical Pine Spaced - 15 Blocks", "default_pine_tree.png^default_pine_sapling.png", 15)
register_conical_pine_spaced_block("pine_generator:conical_pine_spaced_18", "Conical Pine Spaced - 18 Blocks", "default_pine_tree.png^default_pine_sapling.png", 18)
register_conical_pine_spaced_block("pine_generator:conical_pine_spaced_22", "Conical Pine Spaced - 22 Blocks", "default_pine_tree.png^default_pine_sapling.png", 22)
register_conical_pine_spaced_block("pine_generator:conical_pine_spaced_28", "Conical Pine Spaced - 28 Blocks", "default_pine_tree.png^default_pine_sapling.png", 28)
