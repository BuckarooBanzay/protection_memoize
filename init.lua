
protection_memoize = {
  -- opt-in
  -- TODO: set to true after testing
  enabled = false,
  periodic_flush = 2
}

local MP = minetest.get_modpath("protection_memoize")

dofile(MP.."/memoize.lua")
dofile(MP.."/privs.lua")
dofile(MP.."/chatcommands.lua")
dofile(MP.."/is_protected.lua")
dofile(MP.."/periodic_flush.lua")

if minetest.get_modpath("protector") then
  dofile(MP.."/compat/protector.lua")
end

if minetest.get_modpath("priv_protector") then
  dofile(MP.."/compat/priv_protector.lua")
end

if minetest.get_modpath("xp_redo") then
  dofile(MP.."/compat/xp_redo.lua")
end

if minetest.get_modpath("jumpdrive") then
  dofile(MP.."/compat/jumpdrive.lua")
end

if minetest.get_modpath("areas") then
  dofile(MP.."/compat/areas.lua")
end
