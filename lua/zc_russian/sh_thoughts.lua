-- Z-City RU: thoughts — внутренний монолог (я сам себе), не «подсказки игроку»
-- Author: Oppai178

ZC_RU = ZC_RU or {}

local function Female(ply)
	if ThatPlyIsFemale then
		return ThatPlyIsFemale(ply)
	end
	return false
end

local function pick(t)
	return t[math.random(#t)]
end

local function sharp_pain_list()
	return {
		"АААХ!", "АААГХ!", "ААААХх...", "АГХ— БОЛЬНО!", "ААА— СУКА!",
		"АААХХ!", "АА—АГХ!", "ННГХ—!", "ААААА!", "ГХААА!",
	}
end

local function lists_for(ply)
	local f = Female(ply)

	local hungry_a_bit = {
		"Голодно... Надо бы поесть.",
		"Живот подводит. Мне бы еды.",
		"Хотелось бы перекусить.",
		"Сил маловато — без еды мне будет хуже.",
	}

	local very_hungry = {
		"Сильно голоден — крутит живот, еле держусь.",
		"Мне срочно нужна еда, иначе совсем ослабну.",
		"От голода уже тошнит. Надо что-то найти поесть.",
	}
	if f then
		very_hungry = {
			"Сильно голодна — крутит живот, еле держусь.",
			"Мне срочно нужна еда, иначе совсем ослабну.",
			"От голода уже тошнит. Надо что-то найти поесть.",
		}
	end

	local audible_pain = {
		"Боль невыносимая... Надо лечиться, или я отключусь.",
		"Так больно, что почти не соображаю.",
		"Боль забивает всё. Мне нужен обезбол или помощь.",
		"Ещё немного — и я потеряю сознание.",
		"Двигаться почти нельзя — слишком больно.",
		"Это уже не «терпеть», это пытка. Мне надо лечиться.",
	}

	local broken_limb = {
		"Конечность сломана — на неё опираться нельзя.",
		"Был треск — похоже, перелом. Двигать невыносимо больно.",
		"Кость точно сломана. Мне нужна шина или помощь.",
		"Перелом, эта рука или нога почти бесполезна...",
	}

	local dislocated_limb = {
		"Вывих, сустав не на месте... надо вправить.",
		"Конечность вывернута — тянуть нельзя, надо вправить.",
		"Вывихнуто. Без вправления нормально не работает.",
		"Сустав смещён, боль резкая, движения странные...",
	}

	local near_death_poetic = {
		"Крови мало... Сейчас могу отключиться.",
		"Почти не стою — кровопотеря критическая.",
		"Мир плывёт, крови не хватает, надо держаться...",
		"На грани, без помощи долго не протяну...",
		"Слабость и тьма в глазах — мне нужна кровь или лечение.",
	}

	local near_death_positive = {
		"Ещё жив. Нельзя сдаваться — можно вытянуть.",
		"Плохо, но держусь. Надо лечиться и не паниковать.",
		"На грани, но шанс есть. Надо действовать.",
		"Адреналин держит. Надо использовать момент.",
	}
	if f then
		near_death_positive[1] = "Ещё жива. Нельзя сдаваться — можно вытянуть."
	end

	local after_unconscious = {
		"Очнулся... Голова раскалывается. Что было?",
		"Был в отключке. Больно, но я в сознании.",
		"Только что терял сознание. Вставать надо осторожно.",
		"После отключки тело ватное. Надо проверить раны.",
		"Жив... Чуть не конец. Надо опомниться.",
	}
	if f then
		after_unconscious = {
			"Очнулась... Голова раскалывается. Что было?",
			"Была в отключке. Больно, но я в сознании.",
			"Только что теряла сознание. Вставать надо осторожно.",
			"После отключки тело ватное. Надо проверить раны.",
			"Жива... Чуть не конец. Надо опомниться.",
		}
	end

	local fear_phrases = {
		"Страшно... Сердце колотится, руки дрожат.",
		"Паника подступает. Надо дышать ровнее.",
		"Боюсь, что не выберусь из этого.",
		"Страх мешает думать. Надо собраться.",
		"Плохое предчувствие. Надо быть осторожнее.",
	}

	local fear_hurt_ironic = {
		"Ну и день... Если выживу — будет история.",
		"Глупо так подыхать. Надо держаться.",
		"Страшно и смешно одновременно. Нельзя сдаваться.",
		"Как в дешёвом фильме. Только боль настоящая.",
	}

	local is_aimed_at_phrases = {
		"В меня целятся! Дёргаться нельзя.",
		"Дуло на мне. Одно движение — и конец.",
		"Меня держат на мушке. Надо подумать, что делать.",
		"Под прицелом. Если запаникую — убьёт быстрее пули.",
	}

	local random_phrase = {
		"Слишком тихо... Надо быть настороже.",
		"Ничего не происходит. Пока.",
		"Скука и тишина. Расслабляться нельзя.",
		"Время тянется. Чем бы заняться?",
		"Кажется, за мной никто не следит... или следит.",
	}

	local cold_phraselist = {
		"Холодно. Надо найти тепло, иначе хуже.",
		"Знобит. Надо согреться, пока не начало ломать.",
		"Мёрзну. Мне нужна куртка, огонь или укрытие.",
	}

	local freezing_phraselist = {
		"Замерзаю, руки деревенеют, мысли плывут...",
		"Сильный холод — тело плохо слушается.",
		"Ещё немного на морозе — и отключусь.",
	}

	local numb_phraselist = {
		"Уже «не холодно»... это плохо, похоже переохлаждение.",
		"Кажется, потеплело — на деле я замерзаю.",
		"Онемение и ложное тепло... надо согреться СЕЙЧАС.",
	}

	local hot_phraselist = {
		"Жарко, пот градом. Надо остыть и попить воды.",
		"Перегрев, тяжело, липко, кружится голова...",
		"Слишком душно. Надо найти тень и воду.",
	}

	local heatstroke_phraselist = {
		"Тепловой удар, мне бы воды и прохлады...",
		"Голова раскалывается от жары, срочно надо остыть.",
		"Перегрев критический — могу упасть.",
	}

	local slight_brain = {
		"Мысли путаются... Повреждение головы?",
		"Трудно соображать. С головой что-то не так.",
		"Слова и мысли расползаются. Надо быть осторожнее.",
	}

	local braindamage = {
		"Мозг... плохо... почти не понимаю, где я...",
		"Сознание рвётся. Сильное повреждение головы.",
		"Не могу нормально думать — череп и мозг пострадали.",
	}

	local heatvomit = {
		"От жары тошнит, блевану щас походу...",
		"Перегрев до тошноты, надо остыть...",
		"Жара добивает, блевану щас походу...",
	}

	return {
		hungry_a_bit = hungry_a_bit,
		very_hungry = very_hungry,
		audible_pain = audible_pain,
		broken_limb = broken_limb,
		dislocated_limb = dislocated_limb,
		near_death_poetic = near_death_poetic,
		near_death_positive = near_death_positive,
		after_unconscious = after_unconscious,
		fear_phrases = fear_phrases,
		fear_hurt_ironic = fear_hurt_ironic,
		is_aimed_at_phrases = is_aimed_at_phrases,
		random_phrase = random_phrase,
		cold_phraselist = cold_phraselist,
		freezing_phraselist = freezing_phraselist,
		numb_phraselist = numb_phraselist,
		hot_phraselist = hot_phraselist,
		heatstroke_phraselist = heatstroke_phraselist,
		slight_brain = slight_brain,
		braindamage = braindamage,
		heatvomit = heatvomit,
		sharp_pain = sharp_pain_list(),
	}
end

function ZC_RU.InstallThoughts()
	if not hg then return end

	hg.sharp_pain = sharp_pain_list()

	local old_list = hg.get_phraselist

	function hg.get_status_message(ply)
		if not IsValid(ply) then
			if CLIENT then ply = LocalPlayer() else return "" end
		end

		local nomessage = hook.Run("HG_CanThoughts", ply)
		if nomessage ~= nil and nomessage == false then return "" end
		if ply.GetInfoNum and ply:GetInfoNum("hg_showthoughts", 1) == 0 then return "" end

		local org = ply.organism
		if not org or not org.brain then return "" end

		local pain = org.pain
		local brain = org.brain
		local temperature = org.temperature
		local blood = org.blood
		local hungry = org.hungry
		local broken_dislocated = org.just_damaged_bone and ((org.just_damaged_bone + 3 - CurTime()) < -3)
		local fear = org.fear
		local adrenaline = org.adrenaline

		if broken_dislocated and org.just_damaged_bone then
			org.just_damaged_bone = nil
		end

		local broken_notify = (org.rarm == 1) or (org.larm == 1) or (org.rleg == 1) or (org.lleg == 1)
		local dislocated_notify = (org.rarm == 0.5) or (org.larm == 0.5) or (org.rleg == 0.5) or (org.lleg == 0.5)
		local after_unconscious_notify = org.after_otrub

		if not isnumber(pain) then return "" end

		local L = lists_for(ply)
		local most_wanted

		if temperature < 35 then
			most_wanted = temperature > 31 and L.cold_phraselist or (temperature < 28 and L.numb_phraselist or L.freezing_phraselist)
		elseif temperature > 38 then
			most_wanted = temperature < 40 and L.hot_phraselist or L.heatstroke_phraselist
		end

		if not most_wanted and hungry and hungry > 25 and math.random(3) == 1 then
			most_wanted = hungry > 45 and L.very_hungry or L.hungry_a_bit
		end

		if (blood < 3100) or (pain > 75) or (broken_dislocated) or (broken_notify) or (dislocated_notify) then
			if pain > 75 and broken_dislocated then
				most_wanted = math.random(2) == 1 and L.audible_pain or (broken_notify and L.broken_limb or L.dislocated_limb)
			elseif pain > 75 then
				most_wanted = L.audible_pain
			elseif broken_dislocated then
				most_wanted = broken_notify and L.broken_limb or L.dislocated_limb
			end

			if pain > 100 then
				most_wanted = L.sharp_pain
			end

			if not most_wanted then
				if blood < 3100 then
					if adrenaline and adrenaline > 1.3 and fear and fear < 0.5 then
						most_wanted = L.near_death_positive
					else
						most_wanted = L.near_death_poetic
					end
				end
			end
		elseif after_unconscious_notify then
			most_wanted = L.after_unconscious
		elseif hg.nothing_happening and hg.nothing_happening(ply) then
			most_wanted = L.random_phrase
			if hungry and hungry > 25 and math.random(5) == 1 then
				most_wanted = hungry > 45 and L.very_hungry or L.hungry_a_bit
			end
		elseif hg.fearful and hg.fearful(ply) then
			local aimed = 0
			if IsAimedAt then aimed = IsAimedAt(ply) or 0 end
			if aimed > 0.9 then
				most_wanted = L.is_aimed_at_phrases
			elseif math.random(10) == 1 then
				most_wanted = L.fear_hurt_ironic
			else
				most_wanted = L.fear_phrases
			end
		end

		if brain > 0.1 then
			most_wanted = brain < 0.2 and L.slight_brain or L.braindamage
		end

		if most_wanted then
			return pick(most_wanted)
		end
		return ""
	end

	function hg.get_phraselist(ply, type)
		if not IsValid(ply) then
			if CLIENT then ply = LocalPlayer() else return "" end
		end
		if ply.PlayerClassName == "Gordon" or ply.PlayerClassName == "Combine" then return "" end
		if ply.GetInfoNum and ply:GetInfoNum("hg_showthoughts", 1) == 0 then return "" end
		local org = ply.organism
		if not org or not org.brain then return "" end
		if not isstring(type) then return "" end

		local L = lists_for(ply)
		if type == "heatvomit" then
			return pick(L.heatvomit)
		end

		if old_list then
			local r = old_list(ply, type)
			if isstring(r) and r ~= "" and ZC_RU.T then return ZC_RU.T(r) end
			return r
		end
		return ""
	end
end
