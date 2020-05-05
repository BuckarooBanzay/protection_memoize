
local old_is_protected = minetest.is_protected


minetest.is_protected = function(pos, name)
  if not protection_memoize.enabled then
    -- skip memoization check entirely
    return old_is_protected(pos, name)
  end

  local result, is_cached = protection_memoize.is_protected(pos, name)

  -- cached
  if is_cached then
    return result
  end

  -- uncached
  result = old_is_protected(pos, name)
  protection_memoize.cache(pos, name, result)

  return result
end
