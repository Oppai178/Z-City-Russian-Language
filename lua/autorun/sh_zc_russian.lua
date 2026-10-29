-- Z-City Russian — shared/server (quiet)
-- Author: Oppai178

if SERVER then
	AddCSLuaFile("zc_russian/sh_dict.lua")
	AddCSLuaFile("zc_russian/sh_dict_zc_bulk.lua")
	AddCSLuaFile("zc_russian/sh_dict_medicine.lua")
	AddCSLuaFile("zc_russian/sh_thoughts.lua")
	AddCSLuaFile("zc_russian/cl_radial.lua")
	AddCSLuaFile("zc_russian/cl_mainmenu.lua")
	AddCSLuaFile("zc_russian/cl_notify.lua")
	AddCSLuaFile("zc_russian/cl_healthchip.lua")
	AddCSLuaFile("zc_russian/cl_weaponmenu.lua")
	AddCSLuaFile("zc_russian/cl_medicine.lua")
	AddCSLuaFile("autorun/client/!zc_russian_client.lua")
end

local function safeInclude(path)
	local ok, err = pcall(include, path)
	if not ok then
		ErrorNoHalt("[zc_russian] " .. path .. ": " .. tostring(err) .. "\n")
	end
end

safeInclude("zc_russian/sh_dict.lua")
safeInclude("zc_russian/sh_dict_zc_bulk.lua")
safeInclude("zc_russian/sh_dict_medicine.lua")
safeInclude("zc_russian/sh_thoughts.lua")

if SERVER then
	local HEV_COLOR = Color(255, 125, 0, 255)
	local function IsHEVPhrase(msg)
		if not isstring(msg) then return false end
		return string.find(msg, "HEV", 1, true) ~= nil
			or string.find(string.lower(msg), "hev suit", 1, true) ~= nil
	end

	local function WrapServerNotify()
		if not ZC_RU or not ZC_RU.T then return false end
		local PLAYER = FindMetaTable("Player")
		if not PLAYER or not PLAYER.Notify then return false end
		if ZC_RU._sv_notify then return true end
		local old = PLAYER.Notify
		-- signature: Notify(msg, delay, msgKey, showTime, func, clr)
		function PLAYER:Notify(msg, delay, msgKey, showTime, func, clr, ...)
			if isstring(msg) then
				msg = ZC_RU.T(msg)
				if IsHEVPhrase(msg) then
					clr = HEV_COLOR
				end
			end
			return old(self, msg, delay, msgKey, showTime, func, clr, ...)
		end
		ZC_RU._sv_notify = true
		return true
	end
	timer.Create("zc_russian_sv_retry", 2, 20, function()
		if WrapServerNotify() then timer.Remove("zc_russian_sv_retry") end
	end)
end

if CLIENT then
	-- fallback if client autorun order is weird
	safeInclude("zc_russian/cl_notify.lua")
	safeInclude("zc_russian/cl_radial.lua")
	safeInclude("zc_russian/cl_mainmenu.lua")
	safeInclude("zc_russian/cl_healthchip.lua")
	safeInclude("zc_russian/cl_weaponmenu.lua")
	safeInclude("zc_russian/cl_medicine.lua")
end

timer.Create("zc_russian_thoughts_retry", 2, 25, function()
	if not ZC_RU or not ZC_RU.InstallThoughts then return end
	if ZC_RU._thoughts_installed then
		timer.Remove("zc_russian_thoughts_retry")
		return
	end
	if hg and isfunction(hg.get_status_message) then
		if pcall(ZC_RU.InstallThoughts) then
			ZC_RU._thoughts_installed = true
			timer.Remove("zc_russian_thoughts_retry")
		end
	end
end)
