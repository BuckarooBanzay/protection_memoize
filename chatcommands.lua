

minetest.register_chatcommand("protection_memoize_clear", {
  description = "Clears the protection cache",
  privs = { server = true },
  func = function()
    protection_memoize.invalidate_all()
  end
})

minetest.register_chatcommand("protection_memoize_enable", {
  description = "Enables the protection cache",
  privs = { server = true },
  func = function()
    protection_memoize.enabled = true
  end
})

minetest.register_chatcommand("protection_memoize_disable", {
  description = "Disables the protection cache",
  privs = { server = true },
  func = function()
    protection_memoize.enabled = false
  end
})
