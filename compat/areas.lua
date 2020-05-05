
areas:registerOnAdd(function(_, area)
  protection_memoize.invalidate_area(area.pos1, area.pos2, 32)
end)

areas:registerOnRemove(function()
  protection_memoize.invalidate_all()
end)
