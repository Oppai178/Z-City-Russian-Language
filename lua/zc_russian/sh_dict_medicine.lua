-- Medicine Instructions only (PrintName NOT changed)
-- Author: Oppai178
-- Vanilla Z-City Medicine + 1nazuma (author short descs)

ZC_RU = ZC_RU or {}
ZC_RU.dict = ZC_RU.dict or {}
ZC_RU.med_desc = ZC_RU.med_desc or {}

---------------------------------------------------------------------------
-- 1nazuma: short descs by EN PrintName (from author)
---------------------------------------------------------------------------
local NAZUMA = {
	["CMS Surgical Kit"] = "Лечит все раны (кроме сонной артерии) и кости конечностей. Органы не лечит.",
	["Surv12 Field Surgical Kit"] = "Лечит все раны (кроме сонной артерии) и кости конечностей. Органы не лечит.",
	["Aluminum Splint"] = "Лечит кости конечностей.",
	["Defibrillator"] = "Лечит остановку сердца, но может повредить сердце.",
	["AFAK First Aid Kit"] = "Больше бинтов и прочего!",
	["Salewa First Aid Kit"] = "Больше бинтов и прочего!",
	["Grizzly Medical Kit"] = "Больше бинтов и прочего!",
	["Car First Aid Kit"] = "Больше бинтов и прочего!",
	["SJ1 Combat Injector"] = "Содержит бета-блокатор и анальгезию.",
	["Zagustin Injector"] = "На 60 секунд снижает кровотечение из ран, но пока действует — повреждает сердце.",
	["Propital Injector"] = "Боевой стимулятор: тиамин, маннитол, адреналин и анальгезия; помогает организму вырабатывать кровь.",
	["eTG-change Injector"] = "Регенеративный стимулятор: почти восстанавливает органы, если они не уничтожены полностью. Стоит 2 л крови.",
	["Mildronate Injector"] = "Медленно регенерирует повреждённое сердце, но стоит 3 л крови и повреждает печень, желудок и кишечник.",
	["Morphine Injector"] = "Как следует из названия — морфин.",
	["Adrenaline Injector"] = "Как следует из названия — адреналин.",
	["Injector Case"] = "Содержит все инъекторы.",
	["Ibuprofen"] = "Обезболивающее. Можно использовать несколько раз.",
	["Anaglin"] = "Обезболивающее. Можно использовать несколько раз.",
	["Large Bloodbag"] = "1 л крови при критической кровопотере.",
	["Medical Diagnosis Tablet"] = "Как следует из названия — диагностика.",
	["Medical Tablet"] = "Как следует из названия — диагностика.",
}
for k, v in pairs(NAZUMA) do
	ZC_RU.med_desc[k] = v
end

-- ClassName → EN PrintName (for 1nazuma desc lookup)
ZC_RU.med_class_to_en = {
	["weapon_cms"] = "CMS Surgical Kit",
	["weapon_surv12"] = "Surv12 Field Surgical Kit",
	["weapon_splint"] = "Aluminum Splint",
	["weapon_defibrillator"] = "Defibrillator",
	["weapon_afak"] = "AFAK First Aid Kit",
	["weapon_salewa"] = "Salewa First Aid Kit",
	["weapon_grizzly"] = "Grizzly Medical Kit",
	["weapon_car"] = "Car First Aid Kit",
	["weapon_sj1"] = "SJ1 Combat Injector",
	["weapon_zagus"] = "Zagustin Injector",
	["weapon_propital"] = "Propital Injector",
	["weapon_etg"] = "eTG-change Injector",
	["weapon_mildronate"] = "Mildronate Injector",
	["weapon_morphine_injector"] = "Morphine Injector",
	["weapon_adrenaline_injector"] = "Adrenaline Injector",
	["weapon_injectorcase"] = "Injector Case",
	["weapon_ibuprofen"] = "Ibuprofen",
	["weapon_anaglin"] = "Anaglin",
	["weapon_largebloodbag"] = "Large Bloodbag",
	["weapon_medical_pda"] = "Medical Diagnosis Tablet",
}

---------------------------------------------------------------------------
-- Vanilla Z-City Medicine: full Instructions EN → RU
---------------------------------------------------------------------------
local VANILLA_INS = {
	["Adrenaline, also known as epinephrine, is a hormone and medication which is involved in regulating visceral functions. Use this to increase blood pressure and/or stop cardiac arrest. RMB to inject into someone else."] =
		"Адреналин (эпинефрин) — гормон и лекарство, влияет на висцеральные функции. Повышает давление и/или помогает при остановке сердца. ПКМ — уколоть другого.",

	["A wad of gauze bandage, can help stop light bleeding. Since the bandage is not in its packaging, there is little chance that it is sterilized. RMB to use on someone else."] =
		"Марлевый бинт, останавливает лёгкое кровотечение. Не в упаковке — стерильности мало. ПКМ — на другого.",

	["Beta blockers can help in stressful situations, will reduce your panic and adrenaline. Very useful in combat at certain doses. RMB to inject into someone else."] =
		"Бета-блокаторы в стрессе снижают панику и адреналин. В бою полезны в нужной дозе. ПКМ — уколоть другого.",

	["A plastic bag containing neccesary instruments to acknowledge blood and transfuse it. Can be used to help with large blood loss."] =
		"Пакет с инструментами для забора и переливания крови. Помогает при большой кровопотере.",

	["Fentanyl is a highly potent synthetic piperidine opioid primarily used as an analgesic. Fentanyl dose must be strictly observed, as it can quickly lead to opiate overdose. Label says that ~20% is a maximum daily dose. RMB to inject into someone else."] =
		"Фентанил — сильный синтетический опиоид-анальгетик. Дозу соблюдать строго: легко передоз. На этикетке ~20% — макс. суточная доза. ПКМ — уколоть другого.",

	["Fury-13 (Not to be confused with \"Furry-13\", an unrelated pathowogen virus strain) is an incredibly potent stimulator drug. Instead of \"modifying\" how your organism works, this drug aims to provide additional resources instead, making you stronger than ever before. Side effects may include permanent brain damage. Do not use on infected person."] =
		"Fury-13 (не путать с «Furry-13») — мощный стимулятор. Не «ломает» организм, а даёт ресурсы — сила растёт. Побочки: повреждения мозга. Не колоть заражённым.",

	["An experimental combat stimulant refined from early Fury-13 samples with uncertain origin, nicknamed as 'Fury-16'.  Instead of modifying your body, it forces it to burn through every resource for a massive speed boost. Functions by flooding the system with synthetic noradrenaline, inducing extreme vasoconstriction and cardiac output."] =
		"Экспериментальный боевой стимулятор на базе Fury-13, кличка «Fury-16» («Убер» норэпинефрин). Гонит организм на скорость через синтетический норадреналин: сильная вазоконстрикция и выброс сердца.",

	["Mannitol is used intravenously to reduce acutely raised intracranial pressure until more definitive treatment can be applied, e.g., after head trauma. While mannitol injection is the mainstay for treating high pressure in the skull after a bad brain injury, it is no better than hypertonic saline as a first-line treatment. In treatment-resistant cases, hypertonic saline works better. Intra-arterial infusions of mannitol can transiently open the blood-brain barrier by disrupting tight junctions."] =
		"Маннитол внутривенно снижает остро повышенное ВЧД (после ЧМТ и т.п.), пока нет радикального лечения. При refractory-случаях гипертонический NaCl часто лучше.",

	["A small bag containing medical supplies. Has bandages, painkillers, tourniquets and internal bleeding medicine. A necessary thing in hiking, military conditions and just a necessary thing in everyday life. RMB to apply on others, R to change use mode."] =
		"Сумка с расходниками: бинты, обезбол, жгуты, средство от внутреннего кровотечения. Нужна в походе, бою и быту. ПКМ — на другого, R — смена режима.",

	["A very strong medicine used primarily to lower the pressure and/or as an anesthetic. Morphine dose must be strictly observed, as it can lead to opiate overdose. Contains the maximum daily dose. RMB to inject into someone else."] =
		"Сильное средство: снижает давление и/или обезболивает. Дозу морфина соблюдать — передоз. Внутри суточная норма. ПКМ — уколоть другого.",

	["A medicine designed to deal with opiate overdose. RMB to inject into someone else."] =
		"Средство от опиоидного передоза. ПКМ — уколоть другого.",

	["Needle decompression is used to treat tension pneumothorax. LMB to use on yourself; RMB to use on someone else."] =
		"Игла декомпрессии — при напряжённом пневмотораксе. ЛКМ — себе; ПКМ — другому.",

	["Can be used to relieve pain (thanks Mr. Obvious). RMB to use on someone else."] =
		"Снимает боль. ПКМ — на другого.",

	["A water-soluble vitamin (B1) that plays a big part in the organism's metabolism of carbohydrates, fats and proteins."] =
		"Водорастворимый витамин B1 — важен для обмена углеводов, жиров и белков.",

	["An esmarch tourniquet designed to stop large (arterial) bleedings. Can also be used to stop light bleedings, although it makes the limb ineffective."] =
		"Жгут Эсмарха — для сильных (артериальных) кровотечений. Можно и на лёгкие, но конечность станет почти бесполезной.",
}

for k, v in pairs(VANILLA_INS) do
	ZC_RU.dict[k] = v
end

ZC_RU._lower_map = nil
ZC_RU._sorted_keys = nil
