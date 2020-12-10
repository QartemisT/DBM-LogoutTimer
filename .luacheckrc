std = "lua51"
max_line_length = false
exclude_files = {
	".luacheckrc"
}
ignore = {
	"212", -- Unused argument
	"542", -- An empty if branch
}
globals = {
	-- DeadlyBossMods
	"DBM",
	"DBM_DISABLE_ZONE_DETECTION",

	-- WoW
	"GetLocale"
}
