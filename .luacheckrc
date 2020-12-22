std = "lua51"
max_line_length = false
exclude_files = {
	".luacheckrc"
}
ignore = {
	"212/self" -- Unused argument
}
globals = {
	-- DeadlyBossMods
	"DBM",
	"DBM_DISABLE_ZONE_DETECTION",

	-- WoW
	"C_Timer",
	"FlashClientIcon",
	"GetLocale",
	"PlaySound"
}
