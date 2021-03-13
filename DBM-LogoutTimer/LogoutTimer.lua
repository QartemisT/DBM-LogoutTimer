local mod	= DBM:NewMod("DBM-LogoutTimer")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)
mod:RegisterEvents("CHAT_MSG_SYSTEM")

local function ShowAlert()
	FlashClientIcon()
	PlaySound(8585, "Master")
end

local logoutTimer = mod:NewTimer(1500, "TimerLogout", "132212")
local timer30, timer15 = C_Timer.NewTimer(1470, ShowAlert), C_Timer.NewTimer(1485, ShowAlert)

local function Cancel()
	logoutTimer:Stop()
	timer30:Cancel()
	timer15:Cancel()
	mod:UnregisterShortTermEvents()
end

function mod:CHAT_MSG_SYSTEM(msg)
	if msg == L.IdleMessage or msg:find(L.IdleMessage) then
		logoutTimer:Start()
		timer30:Start()
		timer15:Start()
		self:RegisterShortTermEvents("ZONE_CHANGED_NEW_AREA")
	elseif msg == L.UnidleMessage or msg:find(L.UnidleMessage) then
		Cancel()
	end
end

function mod:ZONE_CHANGED_NEW_AREA()
	Cancel()
end
