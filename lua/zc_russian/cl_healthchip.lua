-- Health Chip / Moodles ([Z-City] Moodles) — полный RU
-- Author: Oppai178
-- Патчит локальные HC_L / LANGUAGE через upvalues + словарь + convar

if not CLIENT then return end

ZC_RU = ZC_RU or {}

-- Полные RU-лейблы панели чипа (в оригинале часть insp_* осталась EN)
local HC_L_RU = {
	title          = "ISO-SCAN-4",
	biosensor      = "БИОСЕНСОР",
	live           = "ЖИВ",
	vital          = "ЖИЗНЕННЫЕ ПОКАЗАТЕЛИ",
	blood          = "КРОВЬ",
	pulse          = "ПУЛЬС",
	conscious      = "СОЗНАНИЕ",
	pain           = "БОЛЬ",
	o2sat          = "КИСЛОРОД",
	temp           = "ТЕМПЕРАТУРА",
	cardiac        = "ЧСС",
	hematology     = "КРОВЬ",
	ext_bleed      = "КРОВОТЕЧ. НАРУЖ.",
	int_bleed      = "КРОВОТЕЧ. ВНУТ.",
	bloodtype      = "ГРУППА КРОВИ",
	organs         = "СОСТОЯНИЕ ОРГАНОВ",
	brain          = "МОЗГ",
	heart          = "СЕРДЦЕ",
	lungs          = "ЛЁГКИЕ",
	lung_r         = "П.ЛЁГКОЕ",
	lung_l         = "Л.ЛЁГКОЕ",
	pneumo         = "ПНЕВМОТОРАКС",
	liver          = "ПЕЧЕНЬ",
	stomach        = "ЖЕЛУДОК",
	intestines     = "КИШЕЧНИК",
	destroyed      = "УНИЧТОЖЕНО",
	penetrated     = "ПРОБИТО",
	limbs_sec      = "СОСТОЯНИЕ КОНЕЧНОСТЕЙ",
	rarm           = "П.РУКА",
	larm           = "Л.РУКА",
	rleg           = "П.НОГА",
	lleg           = "Л.НОГА",
	skull          = "ЧЕРЕП",
	chest          = "ГРУДЬ",
	amput          = "АМПУТИРОВАНА",
	furry_sec      = "ПРОЧЕЕ",
	disoriented    = "ДЕЗОРИЕНТАЦИЯ",
	adrenaline_lbl = "АДРЕНАЛИН",
	analgesia_lbl  = "АНАЛЬГЕЗИЯ",
	shock          = "ШОК",
	body_map       = "СОСТОЯНИЕ",
	footer         = "МЕД-ЧИП // БИОСЕНСОР // ISO-SCAN-4",
	denied         = "ДОСТУП ЗАПРЕЩЁН",
	insp_self      = "Мед-чип",
	insp_inspect   = "Осмотреть",
	insp_player    = "игрок",
	insp_body      = "тело",
	insp_chip      = "Осмотреть мед-чип",
	insp_cond      = "Осмотреть состояние",
	insp_menu      = "меню",
}

-- EN -> RU для радиала / draw / панелей (на случай eng-режима)
local CHIP_DICT = {
	["Health Chip"] = "Мед-чип",
	["Inspect"] = "Осмотреть",
	["Inspect health chip"] = "Осмотреть мед-чип",
	["Inspect condition"] = "Осмотреть состояние",
	-- НЕ класть короткие "body"/"player"/"menu" в global dict —
	-- ломают меню одежды (Body → тело + SizeToContents)
	["VITAL SIGNS"] = "ЖИЗНЕННЫЕ ПОКАЗАТЕЛИ",
	["BIOSENSOR"] = "БИОСЕНСОР",
	["LIVE"] = "ЖИВ",
	["BLOOD"] = "КРОВЬ",
	["PULSE"] = "ПУЛЬС",
	["CONSCIOUS"] = "СОЗНАНИЕ",
	["PAIN"] = "БОЛЬ",
	["HEART RATE"] = "ЧСС",
	["BLOOD TYPE"] = "ГРУППА КРОВИ",
	["ORGAN STATUS"] = "СОСТОЯНИЕ ОРГАНОВ",
	["LIMB STATUS"] = "СОСТОЯНИЕ КОНЕЧНОСТЕЙ",
	["BRAIN"] = "МОЗГ",
	["HEART"] = "СЕРДЦЕ",
	["LUNGS"] = "ЛЁГКИЕ",
	["R.LUNG"] = "П.ЛЁГКОЕ",
	["L.LUNG"] = "Л.ЛЁГКОЕ",
	["PNEUMOTHORAX"] = "ПНЕВМОТОРАКС",
	["LIVER"] = "ПЕЧЕНЬ",
	["STOMACH"] = "ЖЕЛУДОК",
	["INTESTINES"] = "КИШЕЧНИК",
	["DESTROYED"] = "УНИЧТОЖЕНО",
	["PIERCED"] = "ПРОБИТО",
	["R.ARM"] = "П.РУКА",
	["L.ARM"] = "Л.РУКА",
	["R.LEG"] = "П.НОГА",
	["L.LEG"] = "Л.НОГА",
	["SKULL"] = "ЧЕРЕП",
	["CHEST"] = "ГРУДЬ",
	["AMPUT"] = "АМПУТИРОВАНА",
	["OTHER"] = "ПРОЧЕЕ",
	["DISORIENTATION"] = "ДЕЗОРИЕНТАЦИЯ",
	["ADRENALINE"] = "АДРЕНАЛИН",
	["ANALGESIA"] = "АНАЛЬГЕЗИЯ",
	["SHOCK"] = "ШОК",
	["STATE"] = "СОСТОЯНИЕ",
	["ACCESS DENIED"] = "ДОСТУП ЗАПРЕЩЁН",
	["HEALTH CHIP // BIOSENSOR // ISO-SCAN-4"] = "МЕД-ЧИП // БИОСЕНСОР // ISO-SCAN-4",
	["EXT.BLEED"] = "КРОВОТЕЧ. НАРУЖ.",
	["INT.BLEED"] = "КРОВОТЕЧ. ВНУТ.",
	["TEMP"] = "ТЕМП.",
	["Zcity Moodle"] = "Z-City Moodle",
	["Enable HUD"] = "Включить HUD",
	["Always show limbs"] = "Всегда показывать конечности",
	["NoPixel icons(test)"] = "NoPixel-иконки (тест)",
	["Enable text change for brain damage"] = "Искажение текста при повреждении мозга",
	["Language"] = "Язык",
	["English"] = "English",
	["Russian"] = "Русский",
	["── Health Chip Panel ──"] = "── Панель чипа здоровья ──",
	["Allow health panel for all players. (mzb_healthchip)"] = "Разрешить панель здоровья всем (mzb_healthchip)",
	["Hover over status icons for detailed info"] = "Наведи на иконки статусов для подробностей",
	["Boot animation typing speed."] = "Скорость печати анимации загрузки.",
	["Faster: 0.005  |  Instant: 0.001  |"] = "Быстрее: 0.005  |  Мгновенно: 0.001  |",
	["BIOS speed"] = "Скорость BIOS",
	["Reset to default (0.0018)"] = "Сбросить по умолчанию (0.0018)",
	["Language set to: "] = "Язык: ",
	["Unknown language. Use: ru / eng"] = "Неизвестный язык. Используй: ru / eng",
	["Usage: mzb_language ru / eng"] = "Использование: mzb_language ru / eng",
}

local function MergeDict()
	if not ZC_RU.dict then ZC_RU.dict = {} end
	for k, v in pairs(CHIP_DICT) do
		ZC_RU.dict[k] = v
	end
	-- purge short keys that break Appearance UI (Body button → «тело» + SizeToContents)
	ZC_RU.dict["body"] = nil
	ZC_RU.dict["player"] = nil
	ZC_RU.dict["menu"] = nil
	ZC_RU._lower_map = nil
	ZC_RU._sorted_keys = nil
end

local function FindUpvalue(fn, targetName, depth)
	if not isfunction(fn) or (depth or 0) > 4 then return nil end
	for i = 1, 40 do
		local name, val = debug.getupvalue(fn, i)
		if not name then break end
		if name == targetName then
			return val, i, fn
		end
		if isfunction(val) then
			local found, idx, owner = FindUpvalue(val, targetName, (depth or 0) + 1)
			if found ~= nil then return found, idx, owner end
		end
	end
	return nil
end

local function PatchHC_L()
	local hooks = hook.GetTable()["radialOptions"]
	if not istable(hooks) then return false end

	local fn = hooks["mzb_chip_self"] or hooks["mzb_chip_inspect"]
	if not isfunction(fn) then return false end

	-- L(key) has upvalues HC_L and LANGUAGE
	local Lfn = select(1, FindUpvalue(fn, "L"))
	if not isfunction(Lfn) then
		-- maybe HC_L is direct upvalue of radial hook
		local hc = select(1, FindUpvalue(fn, "HC_L"))
		if istable(hc) and istable(hc.ru) then
			for k, v in pairs(HC_L_RU) do
				hc.ru[k] = v
			end
			-- also overwrite eng so even eng mode shows RU (user wants full RU)
			if istable(hc.eng) then
				for k, v in pairs(HC_L_RU) do
					hc.eng[k] = v
				end
			end
			ZC_RU._hc_l_patched = true
			return true
		end
		return false
	end

	local hcL, idx, owner = FindUpvalue(Lfn, "HC_L")
	if istable(hcL) then
		if istable(hcL.ru) then
			for k, v in pairs(HC_L_RU) do
				hcL.ru[k] = v
			end
		end
		if istable(hcL.eng) then
			for k, v in pairs(HC_L_RU) do
				hcL.eng[k] = v
			end
		end
		ZC_RU._hc_l_patched = true
	end

	-- force LANGUAGE upvalue to ru if possible
	for i = 1, 20 do
		local name, val = debug.getupvalue(Lfn, i)
		if not name then break end
		if name == "LANGUAGE" then
			debug.setupvalue(Lfn, i, "ru")
			break
		end
	end

	return ZC_RU._hc_l_patched == true
end

local function ForceRuConVar()
	if ConVarExists("mzb_language") then
		local cv = GetConVar("mzb_language")
		if cv and cv:GetString() ~= "ru" then
			RunConsoleCommand("mzb_language", "ru")
		end
	end
end

local function PatchSpawnmenuLabels()
	-- translate tool menu when opened via dict + Walk
	hook.Add("PopulateToolMenu", "zc_russian_moodle_menu", function()
		-- labels created later; walk on next frame when utilities open is hard
		-- dict covers SetText via our global draw wraps partially
	end)
end

function ZC_RU.InstallHealthChip()
	MergeDict()
	ForceRuConVar()
	local ok = false
	pcall(function() ok = PatchHC_L() end)
	return ok
end

-- install
ZC_RU.InstallHealthChip()

timer.Create("zc_russian_healthchip_retry", 2, 20, function()
	if ZC_RU.InstallHealthChip() then
		-- keep a few more tries in case moodles reloads tables
	end
end)

hook.Add("InitPostEntity", "zc_russian_healthchip", function()
	timer.Simple(1, function() ZC_RU.InstallHealthChip() end)
	timer.Simple(5, function() ZC_RU.InstallHealthChip() end)
end)

-- when radial opens, re-patch + force labels through dict
hook.Add("radialOptions", "zzzz_zc_russian_healthchip", function()
	pcall(PatchHC_L)
	ForceRuConVar()
end)
