
-- 1-dimensional spatial index
-- mapblock-x-pos => { pos-hash => { name => result } }
local cache = {}


function protection_memoize.invalidate_area(pos1, pos2, margin)
  local mapblock_x_start = math.floor((math.min(pos1.x, pos2.x)-margin) / 16)
  local mapblock_x_end = math.floor((math.max(pos1.x, pos2.x)+margin) / 16)
  for mapblock_x = mapblock_x_start, mapblock_x_end do
    cache[mapblock_x] = {}
  end
end

function protection_memoize.invalidate(pos, radius)
  local mapblock_x_start = math.floor((pos.x-radius) / 16)
  local mapblock_x_end = math.floor((pos.x+radius) / 16)
  for mapblock_x = mapblock_x_start, mapblock_x_end do
    cache[mapblock_x] = {}
  end
end

function protection_memoize.invalidate_all()
  cache = {}
end

-- returns: result, is_cached
function protection_memoize.is_protected(pos, name)
  local mapblock_x = math.floor(pos.x / 16)
  local hash = minetest.hash_node_position(pos)

  local stride = cache[mapblock_x]
  if not stride then
    -- no such stride yet
    return nil, false
  end

  -- stride exists
  local results = stride[hash]
  if not results then
    -- no results for that pos yet
    return nil, false
  end

  if results[name] == nil then
    -- no cache for that name yet
    return nil, false
  end

  return results[name], true

end

function protection_memoize.cache(pos, name, result)
  local mapblock_x = math.floor(pos.x / 16)
  local hash = minetest.hash_node_position(pos)

  local stride = cache[mapblock_x]
  if not stride then
    -- create stride
    stride = {}
    cache[mapblock_x] = stride
  end

  local results = stride[hash]
  if not results then
    -- create name-map
    results = {}
    stride[hash] = results
  end

  -- cache result
  results[name] = result
end
