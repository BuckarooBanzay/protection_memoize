
local node_def = minetest.registered_nodes["xp_redo:protector"]
assert(node_def)

local old_after_place_node = node_def.after_place_node
assert(old_after_place_node)
local old_after_destruct = node_def.after_destruct
assert(old_after_destruct)
local old_on_receive_fields = node_def.on_receive_fields
assert(old_on_receive_fields)

minetest.override_item("xp_redo:protector", {
  after_place_node = function(pos, placer)
    -- newly placed protector
    protection_memoize.invalidate(pos, 32)
    old_after_place_node(pos, placer)
  end,

  after_destruct = function(pos, oldnode)
    -- removed protector
    protection_memoize.invalidate(pos, 32)
    old_after_destruct(pos, oldnode)
  end,

  on_receive_fields = function(pos, _, fields, sender)
    -- reconfigured protector
    protection_memoize.invalidate(pos, 32)
    old_on_receive_fields(pos, nil, fields, sender)
  end
})
