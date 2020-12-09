local mod	= DBM:NewMod("DBM-LogoutTimer")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)
mod:RegisterEvents("CHAT_MSG_SYSTEM")

local logoutTimer = mod:NewTimer(1500, "TimerLogout", "110310")

function mod:CHAT_MSG_SYSTEM(msg)
	if msg == L.IdleMessage or msg:find(L.IdleMessage) then
		logoutTimer:Start()
	elseif msg == L.UnidleMessage or msg:find(L.UnidleMessage) then
		logoutTimer:Stop()
	end
end
