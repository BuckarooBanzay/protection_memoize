-- flushes the protection cache periodically


-- total cache reset
local function reset_cache()
  protection_memoize.invalidate_all()
  minetest.after(protection_memoize.periodic_flush, reset_cache)
end

-- periodically reset protection cache
minetest.after(protection_memoize.periodic_flush, reset_cache)
