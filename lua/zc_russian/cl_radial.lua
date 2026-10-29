-- Radial menu RU — Author: Oppai178
-- Z-City рисует локальной CreateRadialMenu; options пересобираются EN каждые ~0.25с

if not CLIENT then return end

ZC_RU = ZC_RU or {}

local function TR(s)
	if not isstring(s) or s == "" then return s end
	if not ZC_RU.T then return s end
	local ok, res = pcall(ZC_RU.T, s)
	if ok and isstring(res) then return res end
	return s
end

local function TranslateOptions(options)
	if not istable(options) then return end
	for i = 1, #options do
		local opt = options[i]
		if not istable(opt) then continue end
		-- label в [2]
		if isstring(opt[2]) then
			opt[2] = TR(opt[2])
		end
		-- подписи слотов барабана в [4] (массив строк)
		if istable(opt[4]) then
			for j = 1, #opt[4] do
				if isstring(opt[4][j]) then
					opt[4][j] = TR(opt[4][j])
				end
			end
		end
	end
end

local function RadialOpen()
	return IsValid(MENUPANELHUYHUY)
end

local function WrapDraw()
	if not draw then return end

	if not ZC_RU._old_DrawText and draw.DrawText then
		ZC_RU._old_DrawText = draw.DrawText
	end
	if ZC_RU._old_DrawText then
		draw.DrawText = function(text, font, x, y, colour, xAlign, yAlign)
			if isstring(text) and text ~= "" and ZC_RU.dict then
				-- exact first (HEV BIOS / console / radial labels)
				if ZC_RU.dict[text] then
					text = ZC_RU.dict[text]
				elseif RadialOpen() then
					text = TR(text)
				end
			end
			return ZC_RU._old_DrawText(text, font, x, y, colour, xAlign, yAlign)
		end
	end

	if not ZC_RU._old_SimpleText and draw.SimpleText then
		ZC_RU._old_SimpleText = draw.SimpleText
	end
	if ZC_RU._old_SimpleText then
		draw.SimpleText = function(text, font, x, y, colour, xAlign, yAlign)
			if isstring(text) and text ~= "" and ZC_RU.dict then
				if ZC_RU.dict[text] then
					text = ZC_RU.dict[text]
				elseif RadialOpen() then
					text = TR(text)
				end
			end
			return ZC_RU._old_SimpleText(text, font, x, y, colour, xAlign, yAlign)
		end
	end

	ZC_RU._drawtext_wrapped = true
end

local function WrapCreateRadial()
	if not hg or not isfunction(hg.CreateRadialMenu) then return end
	if ZC_RU._create_wrapped then return end

	local oldCreate = hg.CreateRadialMenu
	hg.CreateRadialMenu = function(options_arg, bAutoClose)
		if istable(options_arg) then
			TranslateOptions(options_arg)
		end
		local r = oldCreate(options_arg, bAutoClose)
		if istable(hg.radialOptions) then
			TranslateOptions(hg.radialOptions)
		end
		return r
	end
	ZC_RU._create_wrapped = true
end

function ZC_RU.InstallRadial()
	if not ZC_RU.T then return false end
	WrapDraw()
	WrapCreateRadial()

	if not ZC_RU._radial_think then
		hook.Add("Think", "zc_russian_radial_force", function()
			if not ZC_RU.T then return end
			if istable(hg) and istable(hg.radialOptions) and #hg.radialOptions > 0 then
				TranslateOptions(hg.radialOptions)
			end
			-- пока меню открыто — держим draw-обёртку
			if RadialOpen() then
				WrapDraw()
			end
		end)
		ZC_RU._radial_think = true
	end

	if not ZC_RU._radial_hook then
		-- после всех аддонов (zzzz) переводим опции
		hook.Add("radialOptions", "zzzz_zc_russian_translate", function()
			if istable(hg) and istable(hg.radialOptions) then
				TranslateOptions(hg.radialOptions)
			end
		end)
		ZC_RU._radial_hook = true
	end

	return true
end

ZC_RU.InstallRadial()

timer.Create("zc_russian_radial_retry", 1, 30, function()
	if ZC_RU.InstallRadial and ZC_RU.T then
		ZC_RU.InstallRadial()
	end
end)

hook.Add("InitPostEntity", "zc_russian_radial_ipe", function()
	timer.Simple(0.5, function()
		if ZC_RU.InstallRadial then ZC_RU.InstallRadial() end
	end)
	timer.Simple(2, function()
		if ZC_RU.InstallRadial then ZC_RU.InstallRadial() end
	end)
end)
