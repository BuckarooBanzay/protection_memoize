

minetest.register_chatcommand("protection_memoize_clear", {
  description = "Clears the protection cache",
  privs = { server = true },
  func = function()
    protection_memoize.invalidate_all()
    return true, "Invalidated protection cache"
  end
})

minetest.register_chatcommand("protection_memoize_enable", {
  description = "Enables the protection cache",
  privs = { server = true },
  func = function()
    protection_memoize.enabled = true
    return true, "protection memoization enabled"
  end
})

minetest.register_chatcommand("protection_memoize_disable", {
  description = "Disables the protection cache",
  privs = { server = true },
  func = function()
    protection_memoize.enabled = false
    return true, "protection memoization disabled"
  end
})
