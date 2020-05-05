
local function override_protector_node(node_name)
  local node_def = minetest.registered_nodes[node_name]
  assert(node_def)

  local old_after_place_node = node_def.after_place_node
  assert(old_after_place_node)
  local old_after_destruct = node_def.after_destruct
  assert(old_after_destruct)

  minetest.override_item(node_name, {
    after_place_node = function(pos, placer)
      -- newly placed protector
      protection_memoize.invalidate(pos, 32)
      old_after_place_node(pos, placer)
    end,

    after_destruct = function(pos, oldnode)
      -- removed protector
      protection_memoize.invalidate(pos, 32)
      old_after_destruct(pos, oldnode)
    end
  })
end

override_protector_node("protector:protect")
override_protector_node("protector:protect2")

minetest.register_on_player_receive_fields(function(player, formname)
	if formname ~= "protector:node" then
		return
	end

  -- reconfigured protector
  local pos = player:get_pos()
  protection_memoize.invalidate(pos, 32)
end)
