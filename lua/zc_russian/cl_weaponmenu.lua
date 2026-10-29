-- Weapon menu translate (except pose names — not in dict)
-- Author: Oppai178

if not CLIENT then return end

ZC_RU = ZC_RU or {}

local function TR(s)
	if not isstring(s) or s == "" then return s end
	-- poses stay English
	if ZC_RU.IsWeaponPoseLabel and ZC_RU.IsWeaponPoseLabel(s) then return s end
	return (ZC_RU.T and ZC_RU.T(s)) or s
end

-- pose list must stay English: never put pose names in dict

local function WalkTranslate(pnl, depth)
	if not IsValid(pnl) or (depth or 0) > 14 then return end
	if pnl.GetText and pnl.SetText then
		local txt = pnl:GetText()
		if isstring(txt) and txt ~= "" and not (ZC_RU.IsWeaponPoseLabel and ZC_RU.IsWeaponPoseLabel(txt)) then
			local tr = TR(txt)
			if tr ~= txt then
				pnl:SetText(tr)
				if pnl.SizeToContents then pcall(function() pnl:SizeToContents() end) end
			end
		end
	end
	if pnl.GetTitle and pnl.SetTitle then
		local txt = pnl:GetTitle()
		if isstring(txt) and txt ~= "" and not (ZC_RU.IsWeaponPoseLabel and ZC_RU.IsWeaponPoseLabel(txt)) then
			local tr = TR(txt)
			if tr ~= txt then pnl:SetTitle(tr) end
		end
	end
	for _, child in ipairs(pnl:GetChildren() or {}) do
		WalkTranslate(child, (depth or 0) + 1)
	end
end

-- after weapon settings / attachments menu open
hook.Add("Think", "zc_russian_weapon_panels", function()
	if not IsValid(LocalPlayer()) then return end
	-- throttle
	if (ZC_RU._wpn_walk_next or 0) > CurTime() then return end
	ZC_RU._wpn_walk_next = CurTime() + 0.35

	for _, p in ipairs(vgui.GetWorldPanel():GetChildren()) do
		if not IsValid(p) or not p:IsVisible() then continue end
		local title = (p.GetTitle and p:GetTitle()) or ""
		-- Weapon options / attachments-ish frames
		if isstring(title) and (title == "Weapon options" or title == "Настройки оружия" or string.find(string.lower(title), "weapon", 1, true)) then
			WalkTranslate(p)
		elseif p.GetClassName and (p:GetClassName() == "ZFrame" or p:GetClassName() == "DFrame") then
			-- attachments menu often untitled or empty title — scan if has Drop buttons text
			local kids = p:GetChildren() or {}
			if #kids > 0 then
				WalkTranslate(p)
			end
		end
	end
end)

-- attachments: " - on the weapon" / Drop via dict when SetText is used
-- also wrap DButton SetText lightly is heavy; dict + walk is enough
