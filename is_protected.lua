local has_monitoring_mod = minetest.get_modpath("monitoring")

local hit_count, miss_count

if has_monitoring_mod then
  hit_count = monitoring.counter("protection_memoize_hit", "Memoizer cache hits")
  miss_count = monitoring.counter("protection_memoize_miss", "Memoizer cache misses")
end


local old_is_protected = minetest.is_protected

minetest.is_protected = function(pos, name)
  if not protection_memoize.enabled then
    -- skip memoization check entirely

    if has_monitoring_mod then
      miss_count.inc()
    end
    return old_is_protected(pos, name)
  end

  local result, is_cached = protection_memoize.is_protected(pos, name)

  -- cached
  if is_cached then
    if has_monitoring_mod then
      hit_count.inc()
    end

    return result
  end

  -- uncached
  result = old_is_protected(pos, name)
  protection_memoize.cache(pos, name, result)

  if has_monitoring_mod then
    miss_count.inc()
  end

  return result
end
