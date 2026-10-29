-- Medicine Instructions ONLY (never touch PrintName / fonts / ContentIcon)
-- Author: Oppai178

if not CLIENT then return end

ZC_RU = ZC_RU or {}

local MEDIC_CAT = {
	["ZCity Medicine"] = true,
	["ZCity 1nazuma's Medicine"] = true,
	["ZCity Anims items"] = true,
}

local function IsMedicineSWEP(w)
	if not istable(w) then return false end
	if isstring(w.Category) and MEDIC_CAT[w.Category] then return true end
	if isstring(w.Category) and string.find(w.Category, "Медицина", 1, true) then return true end

	local cls = w.ClassName or w.Folder or ""
	if not isstring(cls) then return false end
	cls = string.lower(cls)
	return string.find(cls, "med", 1, true)
		or string.find(cls, "bandage", 1, true)
		or string.find(cls, "morphine", 1, true)
		or string.find(cls, "tourniquet", 1, true)
		or string.find(cls, "bloodbag", 1, true)
		or string.find(cls, "defib", 1, true)
		or string.find(cls, "needle", 1, true)
		or string.find(cls, "splint", 1, true)
		or string.find(cls, "naloxone", 1, true)
		or string.find(cls, "mannitol", 1, true)
		or string.find(cls, "fentanyl", 1, true)
		or string.find(cls, "painkiller", 1, true)
		or string.find(cls, "adrenaline", 1, true)
		or string.find(cls, "thiamine", 1, true)
		or string.find(cls, "surgical", 1, true)
		or string.find(cls, "cms", 1, true)
		or string.find(cls, "surv12", 1, true)
		or string.find(cls, "afak", 1, true)
		or string.find(cls, "salewa", 1, true)
		or string.find(cls, "grizzly", 1, true)
		or string.find(cls, "fury", 1, true)
		or string.find(cls, "betablock", 1, true)
		or string.find(cls, "anaglin", 1, true)
		or string.find(cls, "ibuprofen", 1, true)
		or string.find(cls, "propital", 1, true)
		or string.find(cls, "zagus", 1, true)
		or string.find(cls, "mildronate", 1, true)
		or string.find(cls, "injector", 1, true)
end

local function ClassBase(cls)
	if not isstring(cls) then return "" end
	return string.lower(string.match(cls, "([%w_]+)$") or cls)
end

local function LookupInazumaDesc(w)
	if not ZC_RU.med_desc then return nil end
	-- by current PrintName (still EN)
	if isstring(w.PrintName) and ZC_RU.med_desc[w.PrintName] then
		return ZC_RU.med_desc[w.PrintName]
	end
	-- by class
	local map = ZC_RU.med_class_to_en
	if not map then return nil end
	local base = ClassBase(w.ClassName or "")
	local en = map[base]
	if en and ZC_RU.med_desc[en] then return ZC_RU.med_desc[en] end
	return nil
end

local function TranslateInstructions(ins)
	if not isstring(ins) or ins == "" then return ins end
	if ZC_RU.dict and ZC_RU.dict[ins] then return ZC_RU.dict[ins] end

	local trimmed = string.Trim(ins)
	if ZC_RU.dict and ZC_RU.dict[trimmed] then return ZC_RU.dict[trimmed] end

	local norm = string.gsub(string.gsub(ins, "\r\n", "\n"), "\r", "\n")
	norm = string.Trim(norm)
	if ZC_RU.dict and ZC_RU.dict[norm] then return ZC_RU.dict[norm] end

	return ins
end

local function PatchSWEPTable(w)
	if not IsMedicineSWEP(w) then return false end
	if not isstring(w.Instructions) then return false end

	-- Prefer author short desc for 1nazuma (by name/class)
	local inazuma = LookupInazumaDesc(w)
	if inazuma then
		w.Instructions = inazuma
		w._zc_ru_med_ins = true
		return true
	end

	if w._zc_ru_med_ins then return true end

	local tr = TranslateInstructions(w.Instructions)
	if tr ~= w.Instructions then
		w.Instructions = tr
		w._zc_ru_med_ins = true
		return true
	end
	return false
end

function ZC_RU.PatchMedicineWeapons()
	if not weapons or not weapons.GetList then return 0 end
	local n = 0
	for _, wep in ipairs(weapons.GetList()) do
		local cls = wep.ClassName
		if isstring(cls) then
			local stored = weapons.GetStored(cls)
			if istable(stored) and PatchSWEPTable(stored) then n = n + 1 end
		end
		if PatchSWEPTable(wep) then n = n + 1 end
	end

	local lp = LocalPlayer and LocalPlayer()
	if IsValid(lp) then
		for _, wep in ipairs(lp:GetWeapons()) do
			if IsValid(wep) then PatchSWEPTable(wep) end
		end
	end
	return n
end

ZC_RU.PatchMedicineWeapons()

timer.Create("zc_russian_med_ins_patch", 2, 15, function()
	ZC_RU.PatchMedicineWeapons()
end)

hook.Add("InitPostEntity", "zc_russian_med_ins_ipe", function()
	timer.Simple(1, function() ZC_RU.PatchMedicineWeapons() end)
	timer.Simple(5, function() ZC_RU.PatchMedicineWeapons() end)
end)

hook.Add("OnEntityCreated", "zc_russian_med_ins_ent", function(ent)
	if not IsValid(ent) or not ent:IsWeapon() then return end
	timer.Simple(0, function()
		if IsValid(ent) then PatchSWEPTable(ent) end
	end)
end)
