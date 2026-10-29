-- Notify intercept (client net) — quiet
-- Author: Oppai178

if not CLIENT then return end

ZC_RU = ZC_RU or {}

-- same as Z-City HEV suit (sh_gordon / sv_notification)
local HEV_COLOR = Color(255, 125, 0, 255)

local function TR(msg)
	if not isstring(msg) or msg == "" then return msg end
	if ZC_RU.T then return ZC_RU.T(msg) end
	return msg
end

-- HEV phrases in chat/HUD should stay orange
local function IsHEVPhrase(msg)
	if not isstring(msg) or msg == "" then return false end
	if string.find(msg, "HEV", 1, true) then return true end
	local low = string.lower(msg)
	if string.find(low, "hev suit", 1, true) then return true end
	if string.find(low, "h.e.v", 1, true) then return true end
	return false
end

local function ForceHEVColor(msg, clr)
	if IsHEVPhrase(msg) then
		return HEV_COLOR
	end
	return clr or Color(255, 255, 255, 255)
end

local function PushNotification(msg, showTimer, clr)
	msg = TR(msg)
	if msg == "" then return end

	if not IsValid(LocalPlayer()) then return end

	if hg and hg.FurrifyPhrase then
		local fur = GetConVar("hg_furcity")
		if (fur and fur:GetBool()) or (LocalPlayer().PlayerClassName == "furry") then
			msg = hg.FurrifyPhrase(msg)
		end
	end

	if LocalPlayer().IsBerserk and LocalPlayer():IsBerserk() then
		return
	end

	hg = hg or {}
	hg.notifications = hg.notifications or {}

	table.insert(hg.notifications, {
		msg,
		showTimer or 3,
		ForceHEVColor(msg, clr)
	})
end

local function InstallNetReceive()
	net.Receive("HGNotificate", function()
		local msg = net.ReadString()
		local clr = net.ReadColor()
		if msg == "" then return end
		PushNotification(msg, 3, clr)
	end)

	net.Receive("HGNotificateBerserk", function()
		local msg = net.ReadString()
		local clr = net.ReadColor()
		if msg == "" then return end
		PushNotification(msg, 3, clr)
	end)

	ZC_RU._net_installed = true
end

local function WrapLocalPaths()
	if not hg then return end

	if isfunction(hg.CreateNotification) and not ZC_RU._cn_wrapped then
		local old = hg.CreateNotification
		hg.CreateNotification = function(msg, showTimer, clr)
			if isstring(msg) then
				msg = TR(msg)
				clr = ForceHEVColor(msg, clr)
			end
			return old(msg, showTimer, clr)
		end
		ZC_RU._cn_wrapped = true
	end

	local PLAYER = FindMetaTable("Player")
	if PLAYER and isfunction(PLAYER.Notify) and not ZC_RU._pn_wrapped then
		local old = PLAYER.Notify
		function PLAYER:Notify(a, b, c, d, e, f, ...)
			if isstring(a) then
				a = TR(a)
				-- PLAYER:Notify(msg, delay, msgKey, showTime, func, clr) — clr is 6th
				if IsHEVPhrase(a) then
					if istable(f) or IsColor(f) then
						f = HEV_COLOR
					elseif select("#", ...) >= 1 then
						-- rare alt signatures: leave varargs, still force via queue Think
					else
						f = HEV_COLOR
					end
				end
			end
			return old(self, a, b, c, d, e, f, ...)
		end
		ZC_RU._pn_wrapped = true
	end
end

-- Z-City NotificationsDraw washes orange:
--   g = min(painFade, clr.g); b = min(painFade, clr.g)  -- b uses g!
-- so (255,125,0) becomes ~ (255,125,125) on screen; chat still gets real clr.
-- ONLY recolor the actual notify typewriter string — never all GMod text.
local function IsHEVNotifyDrawText(text)
	if not isstring(text) or text == "" then return false end
	local cur = hg and hg.currentNotification
	if not istable(cur) or not isstring(cur[1]) then return false end
	if not IsHEVPhrase(cur[1]) then return false end

	local msg = cur[1]
	if text == msg then return true end

	-- typewriter: utf8.sub prefixes (byte-prefix of full utf8 msg)
	if string.find(msg, text, 1, true) == 1 then return true end

	-- death cut adds trailing "-"
	if string.sub(text, -1) == "-" then
		local bare = string.sub(text, 1, -2)
		if bare ~= "" and string.find(msg, bare, 1, true) == 1 then return true end
	end

	return false
end

local function HEVDrawColor(colour)
	local a = 255
	if IsColor(colour) then
		a = colour.a or 255
	elseif istable(colour) and colour.a then
		a = colour.a
	end
	return Color(HEV_COLOR.r, HEV_COLOR.g, HEV_COLOR.b, a)
end

local function WrapDrawForHEV()
	-- Always rebind from the *current* SimpleTextOutlined so we don't stack
	-- forever and so a previous bad wrap can be replaced after lua refresh.
	if not draw or not draw.SimpleTextOutlined then return end

	-- unwrap once if we already installed
	local base = ZC_RU._hev_outlined_base or draw.SimpleTextOutlined
	if not ZC_RU._hev_outlined_base then
		ZC_RU._hev_outlined_base = draw.SimpleTextOutlined
		base = draw.SimpleTextOutlined
	end

	draw.SimpleTextOutlined = function(text, font, x, y, colour, xAlign, yAlign, outlineWidth, outlineColour)
		if IsHEVNotifyDrawText(text) then
			colour = HEVDrawColor(colour)
		end
		return base(text, font, x, y, colour, xAlign, yAlign, outlineWidth, outlineColour)
	end

	-- Do NOT wrap draw.SimpleText / GlowingText — used by entire GMod HUD.
	-- HEV Gordon notify path uses SimpleTextOutlined only.
	ZC_RU._hev_draw_wrapped = true
end

local function InstallAll()
	InstallNetReceive()
	WrapLocalPaths()
	WrapDrawForHEV()
end

InstallAll()

-- Re-hook only a few times, silent (Z-City may overwrite net.Receive later)
timer.Create("zc_russian_notify_rehook", 5, 6, function()
	InstallAll()
end)

hook.Add("InitPostEntity", "zc_russian_notify", function()
	timer.Simple(2, InstallAll)
end)

hook.Add("Think", "zc_russian_notify_queue", function()
	if not hg then return end
	if istable(hg.notifications) then
		for i = 1, #hg.notifications do
			local t = hg.notifications[i]
			if istable(t) and isstring(t[1]) then
				local tr = TR(t[1])
				if tr ~= t[1] then t[1] = tr end
				if IsHEVPhrase(t[1]) then
					t[3] = HEV_COLOR
				end
			end
		end
	end
	if istable(hg.currentNotification) and isstring(hg.currentNotification[1]) then
		local cur = hg.currentNotification
		local tr = TR(cur[1])
		if tr ~= cur[1] then cur[1] = tr end
		if IsHEVPhrase(cur[1]) then
			cur[4] = HEV_COLOR
		end
	end
end)
