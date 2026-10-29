-- Main menu + settings translate — quiet
-- Author: Oppai178

if not CLIENT then return end

ZC_RU = ZC_RU or {}

local AUTHOR_TITLE = "Автор перевода"
local AUTHOR_URL = "https://steamcommunity.com/id/oonotakeuchi"

local function TR(s)
	if not isstring(s) or s == "" then return s end
	return (ZC_RU.T and ZC_RU.T(s)) or s
end

local function AuthorBtnTbl()
	return {
		Func = function(luaMenu)
			if IsValid(luaMenu) then luaMenu:Close() end
			gui.OpenURL(AUTHOR_URL)
		end,
	}
end

-- Логотип/margins как в оригинале Z-City.
-- Лишняя кнопка чуть сжимает высоту всех пунктов, чтобы колонка
-- занимала ту же высоту, что до «Автор перевода» — пропорции те же.
local function FitButtonsLikeOriginal(menu)
	if not IsValid(menu) or not istable(menu.Buttons) then return end
	local n = #menu.Buttons
	if n < 2 then return end

	-- stock: tall = ScreenScale(15), v-margin = ScreenScale(1.5)
	local factor = (n - 1) / n
	local tall = math.max(ScreenScale(12), ScreenScale(15) * factor)
	local vMargin = math.max(ScreenScale(1), ScreenScale(1.5) * factor)

	for _, btn in ipairs(menu.Buttons) do
		if IsValid(btn) then
			btn:SetTall(tall)
			btn:DockMargin(ScreenScale(15), vMargin, 0, 0)
		end
	end

	if IsValid(menu.lDock) then
		-- margins логотипа — строго как в cl_menu_panel (не трогаем Paint)
		menu.lDock:DockMargin(
			ScreenScale(0),
			ScreenScaleH(90),
			ScreenScale(10),
			ScreenScaleH(90)
		)
		menu.lDock:InvalidateLayout(true)
	end
end

local function PatchZMainMenu()
	local mt = vgui.GetControlTable("ZMainMenu")
	if not mt then return false end
	if mt._zc_ru_patched then return true end

	local oldAddSelect = mt.AddSelect
	if not isfunction(oldAddSelect) then return false end

	-- Кнопки Dock(BOTTOM): первая снизу, последняя сверху.
	-- «Автор перевода» — сразу после Discord.
	function mt:AddSelect(pParent, strTitle, tbl)
		local title = TR(strTitle)
		local ret = oldAddSelect(self, pParent, title, tbl)

		if not self._zc_ru_author_added then
			local key = string.lower(tostring(strTitle or ""))
			if key == "discord" then
				self._zc_ru_author_added = true
				oldAddSelect(self, pParent, AUTHOR_TITLE, AuthorBtnTbl())
			end
		end

		return ret
	end

	local oldInit = mt.Init
	if isfunction(oldInit) then
		function mt:Init(...)
			oldInit(self, ...)
			timer.Simple(0, function()
				if IsValid(self) then FitButtonsLikeOriginal(self) end
			end)
		end
	end

	mt._zc_ru_patched = true
	return true
end

local function PatchSettings()
	if not hg or not hg.settings or not istable(hg.settings.tbl) then return false end
	if ZC_RU._settings_patched then return true end

	local newTbl = {}
	for cat, opts in pairs(hg.settings.tbl) do
		local catRu = TR(cat)
		newTbl[catRu] = newTbl[catRu] or {}
		for cvar, data in pairs(opts) do
			if istable(data) then
				if isstring(data[1]) then data[1] = TR(data[1]) end
				if isstring(data[3]) then data[3] = TR(data[3]) end
			end
			newTbl[catRu][cvar] = data
		end
	end
	hg.settings.tbl = newTbl

	if isfunction(hg.settings.AddOpt) and not hg.settings._zc_ru_addopt then
		local oldAdd = hg.settings.AddOpt
		function hg.settings:AddOpt(strCategory, strConVar, strTitle, bDecimals, bString, category)
			return oldAdd(self, TR(strCategory), strConVar, TR(strTitle), bDecimals, bString, category)
		end
		hg.settings._zc_ru_addopt = true
	end

	ZC_RU._settings_patched = true
	return true
end

local function PatchOldOptions()
	if not hg or not isfunction(hg.AddOptionPanel) then return false end
	if ZC_RU._oldopts_patched then return true end

	local old = hg.AddOptionPanel
	function hg.AddOptionPanel(convarname, mode, optiondata, category)
		optiondata = optiondata or {}
		if isstring(optiondata.desc) then optiondata.desc = TR(optiondata.desc) end
		if isstring(category) then category = TR(category) end
		return old(convarname, mode, optiondata, category)
	end
	ZC_RU._oldopts_patched = true
	return true
end

-- NEVER SizeToContents here — Appearance category buttons are fixed rectangles
local function WalkTranslate(pnl, depth)
	if not IsValid(pnl) or (depth or 0) > 14 then return end
	if pnl.GetText and pnl.SetText then
		local t = pnl:GetText()
		if isstring(t) and t ~= "" then
			local tr = TR(t)
			if tr ~= t then
				pnl:SetText(tr)
			end
		end
	end
	if pnl.GetTitle and pnl.SetTitle then
		local t = pnl:GetTitle()
		if isstring(t) and t ~= "" then
			local tr = TR(t)
			if tr ~= t then pnl:SetTitle(tr) end
		end
	end
	for _, child in ipairs(pnl:GetChildren() or {}) do
		WalkTranslate(child, (depth or 0) + 1)
	end
end

-- Category buttons: always ScreenScale(100)×ScreenScale(16) like Z-City original
local APPEAR_CAT = {
	["Hats"] = true, ["Face"] = true, ["Body"] = true, ["Torso"] = true,
	["Legs/Boots"] = true, ["Legs"] = true, ["Jacket"] = true, ["Pants"] = true,
	["Boots"] = true, ["Gloves"] = true, ["Facemap"] = true,
	["Шапки"] = true, ["Лицо"] = true, ["Тело"] = true, ["Торс"] = true,
	["Ноги"] = true, ["Куртка"] = true, ["Штаны"] = true, ["Ботинки"] = true,
	["Перчатки"] = true, ["Ноги/обувь"] = true, ["Головные уборы"] = true,
	["Лицо (текстура)"] = true,
}

local function FixAppearanceButtonSizes(root)
	if not IsValid(root) then return end
	local wFixed = ScreenScale(100)
	local hFixed = ScreenScale(16)
	local function walk(pnl, depth)
		if not IsValid(pnl) or (depth or 0) > 16 then return end
		if pnl.GetClassName and pnl:GetClassName() == "DButton" and pnl.GetText then
			local t = pnl:GetText() or ""
			if APPEAR_CAT[t] then
				pnl:SetSize(wFixed, hFixed)
				-- keep DockMargin-less absolute layout intact
			end
		end
		for _, c in ipairs(pnl:GetChildren() or {}) do
			walk(c, (depth or 0) + 1)
		end
	end
	walk(root, 0)
end

local function TranslateAppearanceUI(pp)
	if IsValid(pp) then
		WalkTranslate(pp)
		FixAppearanceButtonSizes(pp)
	end
	for _, p in ipairs(vgui.GetWorldPanel():GetChildren()) do
		if IsValid(p) and p.ClassName == "HG_AppearanceMenu" then
			WalkTranslate(p)
			FixAppearanceButtonSizes(p)
		elseif IsValid(p) and p.GetClassName and p:GetClassName() == "HG_AppearanceMenu" then
			WalkTranslate(p)
			FixAppearanceButtonSizes(p)
		end
	end
end

function ZC_RU.InstallMainMenu()
	local a = PatchZMainMenu()
	PatchSettings()
	PatchOldOptions()

	if not ZC_RU._pause_hook then
		hook.Add("OnPauseMenuShow", "zc_russian_mainmenu", function()
			timer.Simple(0, function()
				PatchZMainMenu()
				if IsValid(MainMenu) then WalkTranslate(MainMenu) end
			end)
			timer.Simple(0.2, function()
				if IsValid(MainMenu) then WalkTranslate(MainMenu) end
			end)
		end)
		ZC_RU._pause_hook = true
	end

	if hg and isfunction(hg.DrawSettings) and not ZC_RU._drawsettings_wrapped then
		local old = hg.DrawSettings
		hg.DrawSettings = function(pp)
			PatchSettings()
			local r = old(pp)
			timer.Simple(0.05, function()
				if IsValid(pp) then WalkTranslate(pp) end
				if IsValid(MainMenu) then WalkTranslate(MainMenu) end
			end)
			return r
		end
		ZC_RU._drawsettings_wrapped = true
	end

	if hg and isfunction(hg.CreateApperanceMenu) and not ZC_RU._appearance_wrapped then
		local oldA = hg.CreateApperanceMenu
		hg.CreateApperanceMenu = function(pp)
			local r = oldA(pp)
			-- PointShop net opens UI async; restore fixed rect sizes after translate
			for _, delay in ipairs({ 0.05, 0.2, 0.5, 1.0, 1.5 }) do
				timer.Simple(delay, function()
					TranslateAppearanceUI(pp)
				end)
			end
			return r
		end
		ZC_RU._appearance_wrapped = true
	end

	return a
end

timer.Simple(0, function() ZC_RU.InstallMainMenu() end)
timer.Create("zc_russian_mainmenu_retry", 2, 20, function()
	ZC_RU.InstallMainMenu()
	local mt = vgui.GetControlTable("ZMainMenu")
	if mt and mt._zc_ru_patched and ZC_RU._settings_patched then
		timer.Remove("zc_russian_mainmenu_retry")
	end
end)
