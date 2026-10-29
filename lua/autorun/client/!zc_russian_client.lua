-- Z-City Russian — client boot (quiet)
-- Author: Oppai178

local function safeInclude(path)
	local ok, err = pcall(include, path)
	if not ok then
		ErrorNoHalt("[zc_russian] include fail " .. path .. ": " .. tostring(err) .. "\n")
	end
	return ok
end

safeInclude("zc_russian/sh_dict.lua")
safeInclude("zc_russian/sh_dict_zc_bulk.lua")
safeInclude("zc_russian/sh_dict_medicine.lua")
safeInclude("zc_russian/sh_thoughts.lua")
safeInclude("zc_russian/cl_notify.lua")
safeInclude("zc_russian/cl_radial.lua")
safeInclude("zc_russian/cl_mainmenu.lua")
safeInclude("zc_russian/cl_healthchip.lua")
safeInclude("zc_russian/cl_weaponmenu.lua")
safeInclude("zc_russian/cl_medicine.lua")

concommand.Add("zc_ru_status", function()
	local n = (ZC_RU and ZC_RU.dict and table.Count(ZC_RU.dict)) or 0
	local med = 0
	if ZC_RU and ZC_RU.PatchMedicineWeapons then
		med = ZC_RU.PatchMedicineWeapons() or 0
	end
	print(string.format("[zc_russian] dict=%s net=%s radial=%s thoughts=%s healthchip=%s med_ins=%s",
		n,
		tostring(ZC_RU and ZC_RU._net_installed),
		tostring(ZC_RU and ZC_RU._drawtext_wrapped),
		tostring(ZC_RU and ZC_RU._thoughts_installed),
		tostring(ZC_RU and ZC_RU._hc_l_patched),
		tostring(med)
	))
end)

-- silent reinstall until Z-City / Moodles ready
timer.Create("zc_russian_reinstall", 2, 15, function()
	if ZC_RU and ZC_RU.InstallRadial then pcall(ZC_RU.InstallRadial) end
	if ZC_RU and ZC_RU.InstallMainMenu then pcall(ZC_RU.InstallMainMenu) end
	if ZC_RU and ZC_RU.InstallHealthChip then pcall(ZC_RU.InstallHealthChip) end
	if ZC_RU and ZC_RU.InstallThoughts and not ZC_RU._thoughts_installed and hg and hg.get_status_message then
		if pcall(ZC_RU.InstallThoughts) then
			ZC_RU._thoughts_installed = true
		end
	end
end)
