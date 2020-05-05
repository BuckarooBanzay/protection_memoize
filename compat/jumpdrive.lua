
local old_jumpdrive_move = jumpdrive.move

jumpdrive.move = function(source_pos1, source_pos2, target_pos1, target_pos2)
  -- move first
  old_jumpdrive_move(source_pos1, source_pos2, target_pos1, target_pos2)

  -- invalidate region after move
  protection_memoize.invalidate_area(source_pos1, source_pos2, 32)
  protection_memoize.invalidate_area(target_pos1, target_pos2, 32)
end
