local mod	= DBM:NewMod("DBM-LogoutTimer")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)
mod:RegisterEvents("CHAT_MSG_SYSTEM")

local logoutTimer = mod:NewTimer(1500, "TimerLogout", "132212")
local timer30, timer15

local function showAlert()
	FlashClientIcon()
	PlaySound(8585, "Master")
end

local function cancel()
	logoutTimer:Stop()
	timer30:Cancel()
	timer15:Cancel()
	mod:UnregisterShortTermEvents()
end

function mod:CHAT_MSG_SYSTEM(msg)
	if msg == L.IdleMessage or msg:find(L.IdleMessage) then
		logoutTimer:Start()
		timer30 = C_Timer.NewTimer(1470, showAlert)
		timer15 = C_Timer.NewTimer(1485, showAlert)
		self:RegisterShortTermEvents("ZONE_CHANGED_NEW_AREA")
	elseif msg == L.UnidleMessage or msg:find(L.UnidleMessage) then
		cancel()
	end
end

function mod:ZONE_CHANGED_NEW_AREA()
	cancel()
end
