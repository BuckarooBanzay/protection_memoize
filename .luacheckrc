
globals = {
	"protection_memoize",
	"minetest",
	"jumpdrive"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"vector", "ItemStack",
	"dump",

	-- deps
	"protector",
	"areas",
	"monitoring"
}
