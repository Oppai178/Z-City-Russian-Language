-- Z-City RU dictionary — clean rebuild
-- Author: Oppai178
ZC_RU = ZC_RU or {}
ZC_RU.dict = {}

local D = {
	["Drop Weapon"] = "Выбросить оружие",
	["Do Phrase"] = "Фраза",
	["Do Gesture"] = "Жест",
	["RMB - Menu"] = "ПКМ — меню",
	["Do Phrase\nRMB - Menu"] = "Фраза\nПКМ — меню",
	["Do Gesture\nRMB - Menu"] = "Жест\nПКМ — меню",
	["Yell in pain"] = "Крикнуть от боли",
	["Moan in pain"] = "Стонать от боли",
	["Meow"] = "Мяу",
	["Say something"] = "Сказать что-нибудь",
	["Scared"] = "Страх",
	["Yell"] = "Крик",
	["Cheer"] = "Ликование",
	["Satisfied"] = "Доволен",
	["Yell for help"] = "Звать на помощь",
	["Someone died"] = "Кто-то умер",
	["Die!"] = "Умри!",
	["Wave"] = "Помахать",
	["Salute"] = "Салют",
	["Halt"] = "Стой",
	["Group"] = "Группироваться",
	["Forward"] = "Вперёд",
	["Disagree"] = "Не согласен",
	["Agree"] = "Согласен",
	["Becon"] = "Подозвать",
	["Point"] = "Указать",
	["fuck you"] = "показать средний",
	["Fuck You"] = "Показать средний",
	["thumb_up"] = "большой палец",
	["Thumb Up"] = "Большой палец",
	["Surrender"] = "Сдаться",
	["RMB - Kneel+Surrender"] = "ПКМ — на колени + сдаться",
	["Kneel+Surrender"] = "На колени + сдаться",
	["Surrender\nRMB - Kneel+Surrender"] = "Сдаться\nПКМ — на колени + сдаться",
	["Health Chip"] = "Мед-чип",
	["Мед-чип"] = "Мед-чип",
	["Weapon Menu"] = "Меню оружия",
	["Change Posture"] = "Сменить позу",
	["Change Posture\nRMB - Menu"] = "Сменить позу\nПКМ — меню",
	["Reset Posture"] = "Сбросить позу",
	["Attachments Menu"] = "Меню обвесов",
	["Roll Drum"] = "Прокрутить барабан",
	["Load one bullet"] = "Зарядить один патрон",
	["Inspect"] = "Осмотреть",
	["Unload"] = "Разрядить",
	["Change Ammo Type"] = "Сменить тип патронов",
	["Toggle Laser"] = "Лазер вкл/выкл",
	[" - on the weapon"] = " — на оружии",
	["Drop"] = "Выбросить",
	["Weapon options"] = "Настройки оружия",
	["Positioning"] = "Позиция",
	["OriginX"] = "Смещение X",
	["OriginY"] = "Смещение Y",
	["OriginZ"] = "Смещение Z",
	["Inventory"] = "Инвентарь",
	["Drop Ammo"] = "Выбросить патроны",
	["Drop Equipment"] = "Сбросить снаряжение",
	["Disable NVG"] = "Выключить ПНВ",
	["Enable NVG"] = "Включить ПНВ",
	["Drop clothes"] = "Снять одежду",
	["Request support"] = "Запросить поддержку",
	["Request Airstrike"] = "Запросить авиаудар",
	["Create molotov"] = "Сделать коктейль Молотова",
	["Disconnect"] = "Отключиться",
	["Main Menu"] = "Главное меню",
	["Discord"] = "Discord",
	["Traitor Role"] = "Роль предателя",
	["Achievements"] = "Достижения",
	["Settings"] = "Настройки",
	["Appearance"] = "Внешность",
	["Return"] = "Назад",
	["ZCity options"] = "Настройки Z-City",
	["Optimization"] = "Оптимизация",
	["Other"] = "Прочее",
	["Gameplay"] = "Геймплей",
	["Didn't fire..."] = "Не выстрелило... Патрон не в этой каморе.",
	["Lucky me..."] = "Повезло... Дуло молчит.",
	["I thought that was it..."] = "Думал, всё... А щелчок — пустая камора.",
	["Still not dead..."] = "Ещё жив... В барабане оказалась пустота.",
	["I knew it wasn't there! I really did!.."] = "Я знал, что там пусто! Точно знал!..",
	["FUCK- Thought it would fire..."] = "БЛЯТЬ— Думал, сейчас бабахнет...",
	["HELL YEAH!"] = "ДА! Повезло — ствол молчит!",
	["Luck is on my side!"] = "Удача на моей стороне — патрон не сработал!",
	["I dont think CPR would help here..."] = "Не думаю, что СЛР здесь поможет...",
	["I don't think CPR would help here..."] = "Не думаю, что СЛР здесь поможет...",
	["I dont think I need to check their vitals."] = "Не думаю, что нужно проверять их виталы.",
	["I don't think I need to check their vitals."] = "Не думаю, что нужно проверять их виталы.",
	["This glass shard is cutting through my hand!.."] = "Этот осколок режет мне руку!..",
	["They seem unresponsive."] = "Кажется, они не реагируют.",
	["Inspect health chip"] = "Осмотреть мед-чип",
	["Inspect condition"] = "Осмотреть состояние",
	["Slot №1"] = "Слот №1",
	["Slot 1"] = "Слот 1",
	["Slot-1"] = "Слот-1",
	["Slot №2"] = "Слот №2",
	["Slot 2"] = "Слот 2",
	["Slot-2"] = "Слот-2",
	["Slot №3"] = "Слот №3",
	["Slot 3"] = "Слот 3",
	["Slot-3"] = "Слот-3",
	["Slot №4"] = "Слот №4",
	["Slot 4"] = "Слот 4",
	["Slot-4"] = "Слот-4",
	["Slot №5"] = "Слот №5",
	["Slot 5"] = "Слот 5",
	["Slot-5"] = "Слот-5",
	["Slot №6"] = "Слот №6",
	["Slot 6"] = "Слот 6",
	["Slot-6"] = "Слот-6",
	["Slot №7"] = "Слот №7",
	["Slot 7"] = "Слот 7",
	["Slot-7"] = "Слот-7",
	["Slot №8"] = "Слот №8",
	["Slot 8"] = "Слот 8",
	["Slot-8"] = "Слот-8",
	["DROP WEAPON"] = "Выбросить оружие",
	["DO PHRASE"] = "Фраза",
	["DO GESTURE"] = "Жест",
	["RMB - MENU"] = "ПКМ — меню",
	["YELL IN PAIN"] = "Крикнуть от боли",
	["MOAN IN PAIN"] = "Стонать от боли",
	["MEOW"] = "Мяу",
	["SAY SOMETHING"] = "Сказать что-нибудь",
	["SCARED"] = "Страх",
	["YELL"] = "Крик",
	["CHEER"] = "Ликование",
	["SATISFIED"] = "Доволен",
	["YELL FOR HELP"] = "Звать на помощь",
	["SOMEONE DIED"] = "Кто-то умер",
	["DIE!"] = "Умри!",
	["WAVE"] = "Помахать",
	["SALUTE"] = "Салют",
	["HALT"] = "Стой",
	["GROUP"] = "Группироваться",
	["FORWARD"] = "Вперёд",
	["DISAGREE"] = "Не согласен",
	["AGREE"] = "Согласен",
	["BECON"] = "Подозвать",
	["POINT"] = "Указать",
	["FUCK YOU"] = "показать средний",
	["THUMB_UP"] = "большой палец",
	["THUMB UP"] = "Большой палец",
	["SURRENDER"] = "Сдаться",
	["RMB - KNEEL+SURRENDER"] = "ПКМ — на колени + сдаться",
	["KNEEL+SURRENDER"] = "На колени + сдаться",
	["HEALTH CHIP"] = "Мед-чип",
	["WEAPON MENU"] = "Меню оружия",
	["CHANGE POSTURE"] = "Сменить позу",
	["RESET POSTURE"] = "Сбросить позу",
	["ATTACHMENTS MENU"] = "Меню обвесов",
	["ROLL DRUM"] = "Прокрутить барабан",
	["LOAD ONE BULLET"] = "Зарядить один патрон",
	["INSPECT"] = "Осмотреть",
	["UNLOAD"] = "Разрядить",
	["CHANGE AMMO TYPE"] = "Сменить тип патронов",
	["TOGGLE LASER"] = "Лазер вкл/выкл",
	[" - ON THE WEAPON"] = " — на оружии",
	["DROP"] = "Выбросить",
	["WEAPON OPTIONS"] = "Настройки оружия",
	["POSITIONING"] = "Позиция",
	["ORIGINX"] = "Смещение X",
	["ORIGINY"] = "Смещение Y",
	["ORIGINZ"] = "Смещение Z",
	["INVENTORY"] = "Инвентарь",
	["DROP AMMO"] = "Выбросить патроны",
	["DROP EQUIPMENT"] = "Сбросить снаряжение",
	["DISABLE NVG"] = "Выключить ПНВ",
	["ENABLE NVG"] = "Включить ПНВ",
	["DROP CLOTHES"] = "Снять одежду",
	["REQUEST SUPPORT"] = "Запросить поддержку",
	["REQUEST AIRSTRIKE"] = "Запросить авиаудар",
	["CREATE MOLOTOV"] = "Сделать коктейль Молотова",
	["DISCONNECT"] = "Отключиться",
	["MAIN MENU"] = "Главное меню",
	["DISCORD"] = "Discord",
	["TRAITOR ROLE"] = "Роль предателя",
	["ACHIEVEMENTS"] = "Достижения",
	["SETTINGS"] = "Настройки",
	["APPEARANCE"] = "Внешность",
	["RETURN"] = "Назад",
	["ZCITY OPTIONS"] = "Настройки Z-City",
	["OPTIMIZATION"] = "Оптимизация",
	["OTHER"] = "Прочее",
	["GAMEPLAY"] = "Геймплей",
	["DIDN'T FIRE..."] = "Не выстрелило... Патрон не в этой каморе.",
	["LUCKY ME..."] = "Повезло... Дуло молчит.",
	["I THOUGHT THAT WAS IT..."] = "Думал, всё... А щелчок — пустая камора.",
	["STILL NOT DEAD..."] = "Ещё жив... В барабане оказалась пустота.",
	["I KNEW IT WASN'T THERE! I REALLY DID!.."] = "Я знал, что там пусто! Точно знал!..",
	["FUCK- THOUGHT IT WOULD FIRE..."] = "БЛЯТЬ— Думал, сейчас бабахнет...",
	["LUCK IS ON MY SIDE!"] = "Удача на моей стороне — патрон не сработал!",
	["I DONT THINK CPR WOULD HELP HERE..."] = "Не думаю, что СЛР здесь поможет...",
	["I DON'T THINK CPR WOULD HELP HERE..."] = "Не думаю, что СЛР здесь поможет...",
	["I DONT THINK I NEED TO CHECK THEIR VITALS."] = "Не думаю, что нужно проверять их виталы.",
	["I DON'T THINK I NEED TO CHECK THEIR VITALS."] = "Не думаю, что нужно проверять их виталы.",
	["THIS GLASS SHARD IS CUTTING THROUGH MY HAND!.."] = "Этот осколок режет мне руку!..",
	["THEY SEEM UNRESPONSIVE."] = "Кажется, они не реагируют.",
	["INSPECT HEALTH CHIP"] = "Осмотреть мед-чип",
	["INSPECT CONDITION"] = "Осмотреть состояние",
	["SLOT 1"] = "Слот 1",
	["SLOT-1"] = "Слот-1",
	["SLOT 2"] = "Слот 2",
	["SLOT-2"] = "Слот-2",
	["SLOT 3"] = "Слот 3",
	["SLOT-3"] = "Слот-3",
	["SLOT 4"] = "Слот 4",
	["SLOT-4"] = "Слот-4",
	["SLOT 5"] = "Слот 5",
	["SLOT-5"] = "Слот-5",
	["SLOT 6"] = "Слот 6",
	["SLOT-6"] = "Слот-6",
	["SLOT 7"] = "Слот 7",
	["SLOT-7"] = "Слот-7",
	["SLOT 8"] = "Слот 8",
	["SLOT-8"] = "Слот-8",
}

for k, v in pairs(D) do ZC_RU.dict[k] = v end
ZC_RU._lower_map = nil

-- surrender radial (full phrases first)
ZC_RU.dict["Surrender"] = "Сдаться"
ZC_RU.dict["SURRENDER"] = "СДАТЬСЯ"
ZC_RU.dict["Surrendering"] = "Сдаюсь"
ZC_RU.dict["SURRENDERING"] = "СДАЮСЬ"
ZC_RU.dict["Stop Surrendering"] = "Прекратить сдачу"
ZC_RU.dict["STOP SURRENDERING"] = "ПРЕКРАТИТЬ СДАЧУ"
ZC_RU.dict["Kneel Down"] = "Встать на колени"
ZC_RU.dict["KNEEL DOWN"] = "ВСТАТЬ НА КОЛЕНИ"
ZC_RU.dict["Stand Up"] = "Встать"
ZC_RU.dict["STAND UP"] = "ВСТАТЬ"
ZC_RU.dict["Getting Up..."] = "Встаю..."
ZC_RU.dict["GETTING UP..."] = "ВСТАЮ..."
ZC_RU.dict["Surrender\nRMB - Kneel+Surrender"] = "Сдаться\nПКМ — на колени + сдача"
ZC_RU.dict["Surrendering\nRMB - Options"] = "Сдаюсь\nПКМ — варианты"
ZC_RU.dict["Surrendering (Hands Behind Head)\nRMB - Options"] = "Сдаюсь (руки за головой)\nПКМ — варианты"
ZC_RU.dict["Kneeling + Hands Behind Head\nRMB - Options"] = "На коленях + руки за головой\nПКМ — варианты"
ZC_RU.dict["Kneeling + Hands Up\nRMB - Options"] = "На коленях + руки вверх\nПКМ — варианты"
ZC_RU.dict["RMB - Options"] = "ПКМ — варианты"
ZC_RU.dict["RMB - Kneel+Surrender"] = "ПКМ — на колени + сдача"
ZC_RU.dict["Kneel+Surrender"] = "На колени + сдача"
ZC_RU.dict["Hands Behind Head"] = "Руки за головой"
ZC_RU.dict["Hands Up"] = "Руки вверх"
ZC_RU.dict["You cannot lower your hands yet!"] = "Пока не могу опустить руки!"
ZC_RU.dict["You cannot stand up yet!"] = "Пока не могу встать!"
ZC_RU.dict["You kneel down."] = "Я встаю на колени."
ZC_RU.dict["Minimum hold time updated to "] = "Мин. время удержания: "
ZC_RU.dict["[Surrender] Minimum hold time updated to "] = "[Сдача] Мин. время удержания: "
ZC_RU._lower_map = nil
ZC_RU._sorted_keys = nil

-- Weapon poses must stay English (never partial-translate "Point" inside "Point shooting")
local POSE_LABELS = {
	["regular hold"] = true,
	["hipfire"] = true,
	["left shoulder"] = true,
	["high ready"] = true,
	["low ready"] = true,
	["point shooting"] = true,
	["point shoot"] = true,
	["shooting from cover"] = true,
	["gangsta"] = true,
	["one-handed"] = true,
	["one handed"] = true,
	["somalian"] = true,
	["gangsta shooting"] = true,
	["one-handed shooting"] = true,
	["somalian shooting"] = true,
}

local function IsWeaponPoseLabel(msg)
	if not isstring(msg) then return false end
	local low = string.lower(string.Trim(msg))
	if POSE_LABELS[low] then return true end
	-- list rows sometimes add numbers / brackets
	low = string.gsub(low, "^%d+[%.%):%-%s]+", "")
	low = string.Trim(low)
	if POSE_LABELS[low] then return true end
	return false
end

function ZC_RU.T(msg)
	if not isstring(msg) or msg == "" then return msg end
	local d = ZC_RU.dict
	if d[msg] then return d[msg] end

	-- poses: leave English as requested
	if IsWeaponPoseLabel(msg) then return msg end

	-- revolver slots
	local n = string.match(msg, "^Slot №(%d+)$") or string.match(msg, "^Slot[ %-№]*(%d+)$")
	if n then return "Слот №" .. n end

	-- fix dislocation: "Fix Name's dislocation (leg|arm|jaw)" (+ uppercase draw)
	local who, limb = string.match(msg, "^Fix (.+)'s dislocation %((%w+)%)$")
	if not who then
		who, limb = string.match(msg, "^FIX (.+)'S DISLOCATION %((%w+)%)$")
	end
	if who and limb then
		local limbs = { leg = "нога", arm = "рука", jaw = "челюсть" }
		local ruLimb = limbs[string.lower(limb)] or limb
		return "Вправить кость (" .. ruLimb .. ") — " .. who
	end

	if not ZC_RU._lower_map then
		ZC_RU._lower_map = {}
		for k, v in pairs(d) do
			ZC_RU._lower_map[string.lower(k)] = v
		end
	end
	local low = string.lower(msg)
	if ZC_RU._lower_map[low] then return ZC_RU._lower_map[low] end

	-- multiline: each line separately (exact / lower) — still skip pose lines
	if string.find(msg, "\n", 1, true) then
		local parts = string.Explode("\n", msg)
		for i = 1, #parts do
			local p = parts[i]
			if IsWeaponPoseLabel(p) then
				-- keep
			elseif d[p] then
				parts[i] = d[p]
			elseif ZC_RU._lower_map[string.lower(p)] then
				parts[i] = ZC_RU._lower_map[string.lower(p)]
			end
		end
		return table.concat(parts, "\n")
	end

	-- partial: LONGEST keys first, whole-word-ish
	-- NEVER partial-replace short single words (Point, Drop, Shoot…) — they break pose names
	if not ZC_RU._sorted_keys then
		local keys = {}
		for k, _ in pairs(d) do
			if #k >= 4 then
				local hasSpace = string.find(k, " ", 1, true) ~= nil
				-- allow partial only for phrases, or long enough keys (prefixes like "Minimum hold…")
				if hasSpace or #k >= 12 then
					keys[#keys + 1] = k
				end
			end
		end
		table.sort(keys, function(a, b) return #a > #b end)
		ZC_RU._sorted_keys = keys
	end

	local out = msg
	for _, en in ipairs(ZC_RU._sorted_keys) do
		if string.find(out, en, 1, true) then
			local pos = string.find(out, en, 1, true)
			while pos do
				local after = string.sub(out, pos + #en, pos + #en)
				local before = pos > 1 and string.sub(out, pos - 1, pos - 1) or ""
				local afterIsLetter = after ~= "" and string.match(after, "%a") ~= nil
				local beforeIsLetter = before ~= "" and string.match(before, "%a") ~= nil
				if not afterIsLetter and not beforeIsLetter then
					out = string.sub(out, 1, pos - 1) .. d[en] .. string.sub(out, pos + #en)
					pos = string.find(out, en, 1, true)
				else
					pos = string.find(out, en, pos + 1, true)
				end
			end
		end
	end
	return out
end

ZC_RU.IsWeaponPoseLabel = IsWeaponPoseLabel

-- HEV suit (Gordon + Moodles console/BIOS)
ZC_RU.dict["HEV suit has detected a traumatic brain injury. Injecting mannitol."] = "HEV: обнаружена черепно-мозговая травма. Ввожу маннитол."
ZC_RU.dict["HEV suit has detected pneumothorax. Repairing."] = "HEV: обнаружен пневмоторакс. Устраняю."
ZC_RU.dict["HEV suit has detected pain receptors almost reaching the threshold. Injecting morphine."] = "HEV: болевые рецепторы почти у порога. Ввожу морфин."
ZC_RU.dict["HEV suit has detected a carbon monoxide presence in the organism. Neutralising."] = "HEV: в организме обнаружен угарный газ. Нейтрализую."
ZC_RU.dict["HEV suit has detected fractures. Repairing."] = "HEV: обнаружены переломы. Устраняю."
ZC_RU.dict["HEV suit has detected a critically low pulse. Epinephrine injected. Auto-pulse enabled. Plasma injected."] = "HEV: критически низкий пульс. Введён эпинефрин. Автопульс включён. Введена плазма."
ZC_RU.dict["H.E.V. MARK IV PROTECTIVE SYSTEM"] = "ЗАЩИТНАЯ СИСТЕМА H.E.V. MARK IV"
ZC_RU.dict["Detecting H.E.V. suit hardware...      [OK]"] = "Поиск оборудования костюма H.E.V....      [OK]"
ZC_RU.dict["Loading suit power systems...          [OK]"] = "Загрузка энергосистем костюма...          [OK]"
ZC_RU.dict["Load medical system...                 [OK]"] = "Загрузка медицинской системы...           [OK]"
ZC_RU.dict["Hazard detection module init...        [OK]"] = "Инициализация модуля опасностей...        [OK]"
ZC_RU.dict["Proximity detector calibration...      [OK]"] = "Калибровка датчика приближения...         [OK]"
ZC_RU.dict["Bio-monitor link established...        [OK]"] = "Связь биомонитора установлена...          [OK]"
ZC_RU.dict[">>  HAVE A SAFE DAY  <<"] = ">>  ХОРОШЕГО ДНЯ  <<"
ZC_RU.dict["H.E.V. MARK IV ready."] = "H.E.V. MARK IV готов."
ZC_RU.dict["HAVE A SAFE DAY"] = "ХОРОШЕГО ДНЯ"
ZC_RU.dict["HEV MARK IV uplink: STABLE"] = "Канал HEV MARK IV: СТАБИЛЕН"
ZC_RU.dict["Suit integrity: NOMINAL"] = "Целостность костюма: НОРМА"
ZC_RU.dict["Morphine auto-inject: 4 doses remaining"] = "Автоинъекция морфина: осталось 4 дозы"
ZC_RU.dict["Hazard detection: ACTIVE"] = "Детектор опасностей: АКТИВЕН"
ZC_RU.dict["Bio-monitor sync: OK  latency: 6ms"] = "Синхронизация биомонитора: OK  задержка: 6 мс"
ZC_RU.dict["Power cell: 75%  draining nominal"] = "Элемент питания: 75%  расход в норме"
ZC_RU.dict["Proximity detector: scanning..."] = "Датчик приближения: сканирование..."
ZC_RU.dict["Long jump module: NOT FOUND"] = "Модуль прыжка: НЕ НАЙДЕН"
ZC_RU.dict["Radiation levels: within safe tolerance"] = "Радиация: в пределах нормы"
ZC_RU.dict["Suit temperature: 36.1 C  OK"] = "Температура костюма: 36.1 C  OK"
ZC_RU.dict["Kevlar weave: 91% structural integrity"] = "Кевларовая ткань: 91% целостности"
ZC_RU.dict["Oxygen recycler: nominal  CO2: 0.04%"] = "Регенератор O2: норма  CO2: 0.04%"
ZC_RU.dict["Neural link: STABLE  response: 1.2ms"] = "Нейролинк: СТАБИЛЕН  отклик: 1.2 мс"
ZC_RU.dict["HEV power draw: 0.8 W/s"] = "Потребление HEV: 0.8 Вт/с"
ZC_RU.dict["Emergency beacon: armed  GPS: OK"] = "Аварийный маяк: взведён  GPS: OK"
ZC_RU.dict["HEV MARK IV DIAGNOSTIC FEED"] = "ДИАГНОСТИКА HEV MARK IV"
ZC_RU.dict["HAZARDOUS ENVIRONMENT SUIT"] = "КОСТЮМ ОПАСНОЙ СРЕДЫ"
ZC_RU.dict["NEURAL LINK FAILURE"] = "СБОЙ НЕЙРОЛИНКА"
ZC_RU.dict["!! NEURAL LINK FAILURE // LOG !!"] = "!! СБОЙ НЕЙРОЛИНКА // ЖУРНАЛ !!"
ZC_RU.dict["Jump module"] = "Модуль прыжка"
ZC_RU.dict["Suit power"] = "Энергия костюма"
ZC_RU.dict["Medical system"] = "Медсистема"
ZC_RU.dict["Hazard detection"] = "Детектор опасностей"

-- Fix dislocation radial (self + uppercase draw variants)
ZC_RU.dict["Fix dislocation (leg)"] = "Вправить кость (нога)"
ZC_RU.dict["Fix dislocation (arm)"] = "Вправить кость (рука)"
ZC_RU.dict["Fix dislocation (jaw)"] = "Вправить кость (челюсть)"
ZC_RU.dict["FIX DISLOCATION (LEG)"] = "ВПРАВИТЬ КОСТЬ (НОГА)"
ZC_RU.dict["FIX DISLOCATION (ARM)"] = "ВПРАВИТЬ КОСТЬ (РУКА)"
ZC_RU.dict["FIX DISLOCATION (JAW)"] = "ВПРАВИТЬ КОСТЬ (ЧЕЛЮСТЬ)"
ZC_RU.dict["Fix dislocation"] = "Вправить кость"
ZC_RU.dict["FIX DISLOCATION"] = "ВПРАВИТЬ КОСТЬ"

-- Lungs / oxygen / pneumothorax notifies
ZC_RU.dict["I can feel something filling my lungs."] = "Чувствую, как что-то заполняет лёгкие."
ZC_RU.dict["It's getting harder to breathe."] = "Дышать становится всё труднее."
ZC_RU.dict["I'm really struggling to breathe."] = "Мне правда очень тяжело дышать."
ZC_RU.dict["I'm struggling to breathe..."] = "Мне тяжело дышать..."
ZC_RU.dict["I need to breathe..."] = "Мне нужно подышать..."
ZC_RU.dict["I'm gonna faint right now... There's not enough oxygen."] = "Сейчас упаду... кислорода не хватает."
ZC_RU.dict["There's not enough oxygen... I can't hold much longer..."] = "Кислорода мало... долго не продержусь..."
ZC_RU.dict["I really need some fresh air..."] = "Мне очень нужен свежий воздух..."
ZC_RU.dict["I'm gasping for air..."] = "Я хватаю воздух ртом..."
ZC_RU.dict["Need to breathe air... or I'm gonna faint right here..."] = "Нужно вдохнуть воздуха... или прямо здесь упаду..."
ZC_RU.dict["Oxygen... please..."] = "Кислород... пожалуйста..."
ZC_RU.dict["DROP THE FUCKING MASK"] = "СНИМИ БЛЯТСКУЮ МАСКУ"
ZC_RU.dict["I can't breathe in this mask... I need to take it off."] = "В этой маске не дышится... надо снять."
ZC_RU.dict["Drop the mask, it's not worth it..."] = "Сними маску, оно того не стоит..."
ZC_RU.dict["It's fucking disgusting... and I surely can't breathe in this..."] = "Мерзость... и в этом точно не дышится..."
ZC_RU.dict["Fucking stinks... Gotta take this mask off..."] = "Вонь... надо снять эту маску..."

-- Drugged / high monologues (sv_lungs.lua — exact EN spelling, including typos)
ZC_RU.dict["Ohhh hohoohoooo Ie-like it....."] = "Оххх хохоооо мнеээ нннравится....."
ZC_RU.dict["Fukkenh awesomee..... ffffeeelin gooooood.."] = "Бляяяяя кайффф..... чууувствую себбяяя отлииично.."
ZC_RU.dict["That's theh sStuffff DUDeeee"] = "Вот эттоо вещщщь БРАТАААН"
ZC_RU.dict["I reallly like whatEvER I'm feeling right now...."] = "Мнеее ооочень нннравится всё что я сейчаас чуувствую...."
ZC_RU.dict["Oh yeahhhh this feels gooood!"] = "О дааааа как жее хорооошо!"
ZC_RU.dict["I want to feel likhe this for theRRRREST of my life"] = "Хочу чувствовать себбяяя таак всюююю ЖЖЖИЗНЬ"
ZC_RU.dict["Why am I here even?.. wWhatever whuhhh heh"] = "А я вообще зачем здесь?.. даа лааадно хыыых"
ZC_RU.dict["Whoa re you? Gett outtaheree..."] = "Тыыы ктоо? Вали отсюююдааа..."
ZC_RU.dict["Don't want anything else... this is pERRRfect!.."] = "Больше ничегоо не надо... этто ИДЕАААЛЬНО!.."

-- Spine / paralysis / no feeling (sv_bone)
ZC_RU.dict["I don't feel anything below my hips."] = "Ничего не чувствую ниже бёдер."
ZC_RU.dict["I cant't feel or move anything below my torso."] = "Ничего не чувствую и не двигаю ниже торса."
ZC_RU.dict["I can't feel or move anything below my torso."] = "Ничего не чувствую и не двигаю ниже торса."
ZC_RU.dict["I can't move at all. I can barely even breathe."] = "Вообще не могу двигаться. Еле дышу."
ZC_RU.dict["My head is aching."] = "Голова раскалывается."

-- Jaw broken / dislocated
ZC_RU.dict["I FEEL PIECES OF MY JAW... FUCK-FUCK-FUCK"] = "ЧУВСТВУЮ ОСКОЛКИ ЧЕЛЮСТИ... БЛЯТЬ-БЛЯТЬ-БЛЯТЬ"
ZC_RU.dict["MY JAW IS FUCKING FLOATING IN MY HEAD"] = "ЧЕЛЮСТЬ БЛЯТЬ ПЛАВАЕТ В ГОЛОВЕ"
ZC_RU.dict["MY JAW... OHH IT HURTS REALLY BAD... I FEEL PIECES OF IT MOVING"] = "ЧЕЛЮСТЬ... ОХ КАК БОЛЬНО... ЧУВСТВУЮ, КАК ОСКОЛКИ ХОДЯТ"
ZC_RU.dict["I CAN'T CLOSE MY JAW... IT FUCKING HURTS"] = "НЕ МОГУ ЗАКРЫТЬ ЧЕЛЮСТЬ... ПИЗДЕЦ КАК БОЛЬНО"
ZC_RU.dict["MY JAW... ITS JUST STUCK THERE-- OH ITS PAINING"] = "ЧЕЛЮСТЬ... ПРОСТО ЗАСТРЯЛА— ОХ, НОЕТ"
ZC_RU.dict["I CANT MOVE MY JAW AT ALL... AND ITS REALLY ACHING"] = "ВООБЩЕ НЕ МОГУ ДВИГАТЬ ЧЕЛЮСТЬЮ... И СИЛЬНО НОЕТ"

-- Blood low / faint
ZC_RU.dict["I cant feel anything..."] = "Ничего не чувствую..."
ZC_RU.dict["I can't feel anything..."] = "Ничего не чувствую..."
ZC_RU.dict["I think I'm gonna faint right now..."] = "Кажется, сейчас упаду в обморок..."
ZC_RU.dict["I dont feel so good..."] = "Мне нехорошо..."
ZC_RU.dict["I don't feel so good..."] = "Мне нехорошо..."

-- Freezing / numb (thoughts + notify style)
ZC_RU.dict["I.. ca.. can't feel m-my b-body.."] = "Я.. н-не чу-вствую т-тело.."
ZC_RU.dict["I can't.. f-feel my legs..."] = "Н-не чу-вствую н-ноги..."
ZC_RU.dict["I'm f-fuck-king fre-ezing.."] = "Я з-заеб-бался м-мёрзнуть.."
ZC_RU.dict["I-I think-k my face is num-mb.."] = "К-кажется л-лицо од-деревело.."
ZC_RU.dict["Cold-d.."] = "Х-холод.."
ZC_RU.dict["I.. can't feel any-ythi-ing.."] = "Я.. н-ничего не чу-вствую.."

-- Missing hands SWEP (legkick etc.)
ZC_RU.dict["Where is your hands swep???"] = "Где твои «руки»?"

-- Appearance: short labels so they fit original fixed rectangles (ScreenScale 100×16)
ZC_RU.dict["Hats"] = "Шапки"
ZC_RU.dict["Face"] = "Лицо"
ZC_RU.dict["Body"] = "Тело"
ZC_RU.dict["Torso"] = "Торс"
ZC_RU.dict["Legs/Boots"] = "Ноги"
ZC_RU.dict["Legs"] = "Ноги"
ZC_RU.dict["Jacket"] = "Куртка"
ZC_RU.dict["Pants"] = "Штаны"
ZC_RU.dict["Boots"] = "Ботинки"
ZC_RU.dict["Gloves"] = "Перчатки"
ZC_RU.dict["Facemap"] = "Лицо"
ZC_RU.dict["Rotate"] = "Поворот"
ZC_RU.dict["Apply"] = "Применить"
ZC_RU.dict["Save"] = "Сохранить"
ZC_RU.dict["Load"] = "Загрузить"
ZC_RU.dict["Delete"] = "Удалить"
ZC_RU.dict["MODEL SELECTOR"] = "МОДЕЛЬ"
ZC_RU.dict["Model Selector"] = "Модель"
ZC_RU.dict["BODYGROUPS"] = "ГРУППА ТЕЛА"
ZC_RU.dict["Bodygroups"] = "Группа тела"
ZC_RU.dict["ALL FACEMAPS"] = "ЛИЦА"
ZC_RU.dict["All Facemaps"] = "Лица"
ZC_RU.dict["SHOWCASE"] = "СЕТЫ"
ZC_RU.dict["Showcase"] = "Сеты"
ZC_RU.dict["Select Hat"] = "Шапка"
ZC_RU.dict["Select Face Accessory"] = "Аксессуар лица"
ZC_RU.dict["Select Body Accessory"] = "Аксессуар тела"
ZC_RU.dict["Preset name..."] = "Имя пресета..."
ZC_RU.dict["Enter preset name to delete"] = "Введи имя пресета для удаления"
ZC_RU.dict["Preset not found!"] = "Пресет не найден!"
ZC_RU.dict["Failed to load preset!"] = "Не удалось загрузить пресет!"
ZC_RU.dict["None"] = "Нет"

-- Blood vomit / internal bleed notifies (sv_blood.lua)
ZC_RU.dict["That's... that's blood I just vomited..."] = "Это... это кровь — меня только что вырвало кровью..."
ZC_RU.dict["Oh, that's blood..."] = "Ох, это кровь..."
ZC_RU.dict["Fuck, I just puked blood..."] = "Блять, меня вырвало кровью..."
ZC_RU.dict["Oh shit... I don't feel good..."] = "Вот дерьмо... Мне плохо..."
ZC_RU.dict["I feel like I'm gonna puke any second now..."] = "Сейчас меня стошнит, вот-вот..."
ZC_RU.dict["Not feeling good..."] = "Чувствую себя паршиво..."
ZC_RU.dict["Gonna puke right now..."] = "Сейчас вырвет..."
ZC_RU.dict["I want to vomit..."] = "Меня тошнит..."

-- ========== 1nazuma Enhanced Medicine (surgical kit / defib) ==========
-- Surgical kit: healthy (no need to stitch)
ZC_RU.dict["There's nothing serious to fix here."] = "Тут нечего серьёзного лечить."
ZC_RU.dict["All wounds seem already treated."] = "Все раны вроде уже обработаны."
ZC_RU.dict["Why am I holding this?"] = "Зачем я это держу?"
ZC_RU.dict["I should save this for when it's really needed."] = "Лучше приберечь, пока правда не понадобится."
ZC_RU.dict["No need for surgery."] = "Хирургия не нужна."
ZC_RU.dict["Cause another injury,hum?"] = "Ещё одну травму устроить, да?"
ZC_RU.dict["My kit stays in the bag. Nothing to do."] = "Набор остаётся в сумке. Делать нечего."
ZC_RU.dict["I'd just be wasting supplies."] = "Только расходники зря потрачу."
ZC_RU.dict["I didn't see any wounds."] = "Ран не вижу."
ZC_RU.dict["Kept waiting,huh? No wounds, it's fine."] = "Ждал, да? Ран нет — всё нормально."
ZC_RU.dict["Nah, Why am I doing this?"] = "Не, а зачем я это делаю?"

-- Surgical: can't stitch / untreatable
-- "stitch / needle and thread" → сшить/зашить; общее "fix" → лечить
ZC_RU.dict["This is beyond what I can fix with a needle and thread..."] = "Это уже не то, что можно сшить иголкой с ниткой..."
ZC_RU.dict["This needs a proper surgeon, not a field kit."] = "Нужен нормальный хирург, а не полевой набор."
ZC_RU.dict["I can't fix this... it's too deep."] = "Не зашью... слишком глубоко."
ZC_RU.dict["Shit... this isn't something I can stitch up."] = "Блять... это не то, что можно просто зашить."
ZC_RU.dict["God damn it... why did it have to be this bad?"] = "Чёрт... почему всё так плохо?"
ZC_RU.dict["No... no, I can't do this. Not here."] = "Нет... нет, я не справлюсь. Не здесь."
ZC_RU.dict["This wound is laughing at my kit..."] = "Эта рана смеётся над моим набором..."
ZC_RU.dict["I can survive, I'm ok!"] = "Я выживу, я в порядке!"
ZC_RU.dict["I did what I could, but some injuries remain..."] = "Сделал что мог, но кое-что осталось..."
ZC_RU.dict["Damn it...the wounds are too terrible to fix..."] = "Чёрт... раны слишком страшные, не вылечить..."
ZC_RU.dict["This is the far that a field kit can do..."] = "Это максимум, на что способен полевой набор..."

-- Surgical cancel / pain (common)
ZC_RU.dict["Sorry!"] = "Прости!"
ZC_RU.dict["Forgive me, ok?"] = "Прости, ладно?"
ZC_RU.dict["No! The needle slipped!"] = "Нет! Игла соскользнула!"
-- to patient during surgery / defib (in-world address, not the player at the screen)
ZC_RU.dict["Hold on...hold on..."] = "Держись... держись..."
ZC_RU.dict["Keep awake, don't sleep."] = "Не отключайся, не спи."
ZC_RU.dict["The wounds tore open even more!"] = "Раны разошлись ещё сильнее!"
ZC_RU.dict["I don't think I should have stopped..."] = "Не надо было останавливаться..."
ZC_RU.dict["I hope this won't make it worse..."] = "Надеюсь, хуже не станет..."
ZC_RU.dict["Hey! Don't move!"] = "Эй! Не двигайся!"
ZC_RU.dict["I can't doing it while moving!"] = "Не могу делать это, пока двигаешься!"
ZC_RU.dict["Calm down!"] = "Успокойся!"
ZC_RU.dict["No! Wait!"] = "Нет! Стой!"
ZC_RU.dict["Too far away."] = "Слишком далеко."

-- Surgical: can't operate while lying (Cancel_lay)
ZC_RU.dict["I don't think I can do this while I'm laying."] = "Не думаю, что смогу это сделать лёжа."
ZC_RU.dict["What if I fall asleep during surgery?"] = "А если я усну во время операции?"
ZC_RU.dict["What a foolish position to do this."] = "Какая дурацкая поза для этого."
ZC_RU.dict["I'd better to get up."] = "Лучше встать."
ZC_RU.dict["No, I can't catch my limbs."] = "Нет, я не могу дотянуться до конечностей."
ZC_RU.dict["Too far to catch."] = "Слишком далеко, не достать."
ZC_RU.dict["Why do this while lying down? It's so inconvenient."] = "Зачем делать это лёжа? Так неудобно."

-- Surgical fail: Cancel_self
ZC_RU.dict["Damn...ahhh! The needle is killing me!"] = "Блять... ааа! Игла меня убивает!"
ZC_RU.dict["Why didn't I choose that bandage?!"] = "Почему я не выбрал бинт?!"
ZC_RU.dict["Damn it, Why at this time?!"] = "Чёрт, почему именно сейчас?!"
ZC_RU.dict["My wounds...they're still bleeding!"] = "Раны... всё ещё кровоточат!"
ZC_RU.dict["I should check around next time..."] = "В следующий раз сначала осмотрюсь..."
ZC_RU.dict["Have more important things to do."] = "Есть дела поважнее."
ZC_RU.dict["No! My wounds!"] = "Нет! Мои раны!"
ZC_RU.dict["Worse..."] = "Хуже..."

-- Surgical fail: Cancel_patient
ZC_RU.dict["My wounds... they're WORSE now!"] = "Раны... теперь ХУЖЕ!"
ZC_RU.dict["The needle... it tore something... I can feel it..."] = "Игла... что-то порвала... чувствую..."
ZC_RU.dict["The pain... it's worse than before... MUCH worse..."] = "Боль... хуже, чем раньше... ГОРАЗДО хуже..."
ZC_RU.dict["Please... PLEASE come back... I can't die like this..."] = "Пожалуйста... ПОЖАЛУЙСТА вернись... не хочу так умереть..."
ZC_RU.dict["All that suffering... for NOTHING..."] = "Все эти муки... ВПУСТУЮ..."
ZC_RU.dict["The stitches... they ripped... I'm tearing open..."] = "Швы... разошлись... меня рвёт..."
ZC_RU.dict["The blood... there's so much more blood now..."] = "Крови... теперь её ещё больше..."

-- Surgical fail: Cancel_arm
ZC_RU.dict["The trembling hands are perfectly balanced? Kidding me."] = "Дрожащие руки — идеальный баланс? Да ладно."
ZC_RU.dict["My arms are broken,I can't do it..."] = "Руки сломаны, не могу..."
ZC_RU.dict["I hate my stupid arms!"] = "Ненавижу свои дурацкие руки!"
ZC_RU.dict["Better to call a doctor for me."] = "Лучше позвать врача ко мне."
ZC_RU.dict["Arms are too heavy..."] = "Руки слишком тяжёлые..."
ZC_RU.dict["Someone help me...please..."] = "Кто-нибудь помогите... пожалуйста..."
ZC_RU.dict["Why am I still here...just to suffer?"] = "Зачем я ещё здесь... только страдать?"

-- Surgical fail: painMsgs (surgeon) / patientPainMsgs
ZC_RU.dict["It's convulsing! I can't hold the needle!"] = "Судорожит! Не могу удержать иглу!"
ZC_RU.dict["Too much pain! The body is rejecting the surgery!"] = "Слишком больно! Тело срывает операцию!"
ZC_RU.dict["The pain... it's making thrash around!"] = "Боль... заставляет биться и дёргаться!"
ZC_RU.dict["I can't operate like this! It's in too much agony!"] = "Так оперировать нельзя! Слишком мучается!"
ZC_RU.dict["The stitches tore! Response is too strong!"] = "Швы разошлись! Реакция слишком сильная!"
ZC_RU.dict["MAKE IT STOP! THE PAIN!"] = "ПРЕКРАТИ! БОЛЬНО!"
ZC_RU.dict["I can't take it... it hurts too much..."] = "Не могу... слишком больно..."
ZC_RU.dict["Please... no more... the pain is unbearable..."] = "Пожалуйста... хватит... боль невыносима..."
ZC_RU.dict["AGH! The needle... it's tearing me apart!"] = "АГХ! Игла... меня разрывает!"
ZC_RU.dict["I can't... I can't stay still... it hurts!"] = "Не могу... не могу лежать смирно... больно!"

-- Surgical progress: Progress_self
-- self-surgery monologue (я себе)
ZC_RU.dict["Okay... okay, I can do this. Just like they showed us."] = "Так... так, я справлюсь. Как нас учили."
ZC_RU.dict["Steady hands... steady hands..."] = "Руки, ровно... ровно..."
ZC_RU.dict["Focus... breathe... almost done."] = "Сосредоточюсь... дышу... почти готово."
ZC_RU.dict["Almost done... just need to tie it off."] = "Почти готово... осталось только завязать."
ZC_RU.dict["The worst is over... I think. Almost done."] = "Худшее позади... вроде. Почти готово."
ZC_RU.dict["I can see the end... just a bit more."] = "Уже вижу конец... ещё чуть-чуть."
ZC_RU.dict["Please hold... please don't start bleeding again."] = "Только бы держалось... только бы снова не пошла кровь."
ZC_RU.dict["Made it... I actually made it without passing out."] = "Сделал... и даже не отключился."

-- surgeon to patient (речь другому человеку в мире, не «в монитор»)
ZC_RU.dict["Hold still... this is going to take a while."] = "Не дёргайся... это займёт время."
ZC_RU.dict["Deep breath... for both of us. Here we go."] = "Глубокий вдох... для нас обоих. Поехали."
ZC_RU.dict["The wound's deeper than I thought... but I'm managing."] = "Рана глубже, чем думал... но справляюсь."
ZC_RU.dict["Almost done. Just need to close this last part."] = "Почти готово. Осталось закрыть последний участок."
ZC_RU.dict["You're going to make it. Almost finished here."] = "Ты выживешь. Я почти закончил."
ZC_RU.dict["Last few stitches. Try to stay still just a bit longer."] = "Последние швы. Потерпи ещё немного."
ZC_RU.dict["The worst is behind us now. Just tying off."] = "Худшее позади. Осталось завязать."
ZC_RU.dict["Done. That was close, but you'll live."] = "Готово. Было близко, но ты выживешь."
ZC_RU.dict["All set. Take it easy for a while, okay?"] = "Всё. Побереги себя какое-то время, ладно?"

-- Surgical progress: Progress_other_patient
ZC_RU.dict["Agh... that needle's cold..."] = "Агх... игла холодная..."
ZC_RU.dict["I can feel every stitch... god damn it..."] = "Чувствую каждый шов... чёрт..."
ZC_RU.dict["Don't stop... please don't stop now..."] = "Не останавливайся... пожалуйста, не сейчас..."
ZC_RU.dict["Almost done? Please say you're almost done..."] = "Почти? Скажи, что почти готово..."
ZC_RU.dict["I don't know how much longer I can stay still..."] = "Не знаю, сколько ещё смогу лежать смирно..."
ZC_RU.dict["Just... finish it... I'm trying not to scream..."] = "Просто... доделай... стараюсь не орать..."
ZC_RU.dict["Hurts... but do what you have to do..."] = "Больно... но делай что нужно..."
ZC_RU.dict["So close... I can feel it..."] = "Почти... чувствую..."
ZC_RU.dict["You... you actually did it..."] = "Ты... ты реально сделал..."
ZC_RU.dict["I owe you... I owe you big time..."] = "Я тебе должен... очень должен..."
ZC_RU.dict["Is it over? Is it really over?"] = "Конец? Правда конец?"

-- Defibrillator: success
ZC_RU.dict["We have a pulse! Rhythm restored!"] = "Есть пульс! Ритм восстановлен!"
ZC_RU.dict["Sinus rhythm! They're back!"] = "Синусовый ритм! Ожил!"
ZC_RU.dict["Defibrillation successful. Monitor closely."] = "Дефибрилляция удалась. Надо следить внимательно."
ZC_RU.dict["Heart's beating again! Don't let them crash!"] = "Сердце снова бьётся! Нельзя дать снова упасть!"
ZC_RU.dict["ROSC achieved! Get them stabilized!"] = "Есть спонтанное кровообращение! Надо стабилизировать!"
ZC_RU.dict["Yes! Pulse palpable. We did it!"] = "Да! Пульс есть. Получилось!"

-- Defib success (patient)
ZC_RU.dict["Wh... what happened? I was... dead?"] = "Ч... что случилось? Я был... мёртв?"
ZC_RU.dict["I can feel my heart... it's beating..."] = "Чувствую сердце... оно бьётся..."
ZC_RU.dict["Thank you... thank you..."] = "Спасибо... спасибо..."
ZC_RU.dict["I saw a light... then you pulled me back..."] = "Видел свет... а потом ты вытащил меня..."
ZC_RU.dict["It hurts... but I'm alive..."] = "Больно... но я жив..."
ZC_RU.dict["Don't... don't let me go again..."] = "Не... не отпускай меня снова..."

-- Defib fail / partial
ZC_RU.dict["I delivered the shock, but the rhythm didn't convert..."] = "Удар дал, но ритм не восстановился..."
ZC_RU.dict["Damn it...asystole. No electrical activity to reset."] = "Чёрт... асистолия. Нечего сбрасывать."
ZC_RU.dict["This is the far that a field defib can do..."] = "Это максимум полевого дефибриллятора..."
ZC_RU.dict["Pulseless electrical activity... shock won't help."] = "Электрическая активность без пульса... шок не поможет."
ZC_RU.dict["Fine VF, but no cardiac output. They're gone."] = "Мелкая фибрилляция, но выброса нет. Конец."

-- Defib progress
ZC_RU.dict["Charging defibrillator... stand clear."] = "Заряжаю дефибриллятор... отойдите."
ZC_RU.dict["200 joules ready. Everyone clear!"] = "200 джоулей. Все прочь!"
ZC_RU.dict["Analyzing rhythm... shock advised."] = "Анализирую ритм... рекомендую разряд."
ZC_RU.dict["Patient is in V-fib. Preparing countershock."] = "Фибрилляция желудочков. Готовлю разряд."
ZC_RU.dict["Charging... keep the airway open."] = "Заряжаю... дыхательные пути должны быть открыты."
ZC_RU.dict["Almost there... paddles positioned."] = "Почти... электроды на месте."
ZC_RU.dict["Clear the area! Delivering shock soon."] = "Освободите зону! Сейчас будет разряд."
ZC_RU.dict["Don't touch the patient. Charging complete."] = "Не трогайте пациента. Заряд готов."

-- Defib self progress / stand
ZC_RU.dict["Okay... charging to 200 joules..."] = "Так... заряд 200 джоулей..."
ZC_RU.dict["Clear! ...Wait, I'm the patient."] = "Отойти! ...Стоп, пациент — я."
ZC_RU.dict["Focus... breathe... almost charged."] = "Сосредоточюсь... дышу... почти заряжено."
ZC_RU.dict["Please work... please work..."] = "Пожалуйста, сработай... пожалуйста..."
ZC_RU.dict["The worst is over... I think. Almost ready."] = "Худшее позади... вроде. Почти готово."
ZC_RU.dict["I can do this... just like in training."] = "Я справлюсь... как на тренировке."
ZC_RU.dict["Charging... don't die on me now."] = "Заряжаю... только бы не отключиться сейчас."
ZC_RU.dict["Need to lie down first. Can't position the paddles like this."] = "Сначала лечь. Так электроды не поставить."
ZC_RU.dict["This is awkward... I need to be on the ground."] = "Неудобно... нужно лечь на землю."
ZC_RU.dict["How am I supposed to shock myself while standing?"] = "Как себя бить током стоя?"
ZC_RU.dict["Gravity is not my friend right now."] = "Гравитация сейчас не на моей стороне."
ZC_RU.dict["Should probably collapse first."] = "Сначала, наверное, упасть."
ZC_RU.dict["Use LMB to defibrillate yourself."] = "ЛКМ — дефибриллировать себя."
ZC_RU.dict["No! The paddles slipped!"] = "Нет! Электроды соскользнули!"
ZC_RU.dict["The shock delivered too early!"] = "Разряд слишком рано!"
ZC_RU.dict["Hey! Don't move the patient!"] = "Эй! Не двигай пациента!"
ZC_RU.dict["I can't position the paddles while they're moving!"] = "Не могу поставить электроды, пока двигается!"

-- Defib untreatable (short common ones)
ZC_RU.dict["The carotid is severed... brain death is certain."] = "Сонная перерезана... смерть мозга неизбежна."
ZC_RU.dict["Too much blood loss from the neck... nothing can save them now."] = "Слишком много крови из шеи... уже не спасти."
ZC_RU.dict["I can see the arterial spray... this is beyond defibrillation."] = "Вижу артериальную струю... дефибрилляция бесполезна."
ZC_RU.dict["Neck wound's too severe. Heart won't matter if brain is dead."] = "Рана на шее слишком тяжёлая. Сердце не поможет при мёртвом мозге."
ZC_RU.dict["Shit... the carotid... they're already gone."] = "Блять... сонная... уже всё."
ZC_RU.dict["No... no, I can't bring back the dead. Not like this."] = "Нет... нет, мёртвых не воскресить. Не так."
ZC_RU.dict["Brain activity is flat... they're gone."] = "Мозг молчит... конец."
ZC_RU.dict["This is brain death. The heart won't help."] = "Это смерть мозга. Сердце не поможет."
ZC_RU.dict["Shit... brain herniation. Nothing I can do."] = "Блять... вклинение мозга. Ничего не сделать."
ZC_RU.dict["Skull is caved in... brain matter visible."] = "Череп вдавлен... видно мозг."
ZC_RU.dict["Defibrillating a crushed skull? Pointless."] = "Дефибриллировать раздробленный череп? Бессмысленно."
ZC_RU.dict["Shit... the cranial fracture... they're gone."] = "Блять... перелом черепа... конец."
ZC_RU.dict["Lungs are completely collapsed. No oxygen to circulate."] = "Лёгкие полностью спались. Нечего разгонять."
ZC_RU.dict["Need to decompress the chest first... but there's no time."] = "Сначала нужна декомпрессия грудной клетки... но времени нет."
ZC_RU.dict["Defibrillation won't help if they can't breathe."] = "Дефибрилляция не поможет, если не дышит."
ZC_RU.dict["Shit... tension pneumothorax. Wrong tool for the job."] = "Блять... напряжённый пневмоторакс. Не тот инструмент."
ZC_RU.dict["Need to warm them up first. Defibrillator won't work on ice."] = "Сначала согреть. Дефибриллятор по льду не работает."
ZC_RU.dict["Shit... they're frozen. Electricity won't restart a frozen heart."] = "Блять... замёрз. Током замёрзшее сердце не заведёшь."
ZC_RU.dict["Not enough blood to circulate. Empty veins."] = "Крови не хватает. Вены пустые."
ZC_RU.dict["They've bled out. Pumping a dry heart is useless."] = "Вытек. Гонять сухое сердце бесполезно."
ZC_RU.dict["Need blood, not electricity. Transfusion first."] = "Нужна кровь, не ток. Сначала переливание."
ZC_RU.dict["Shit... the pool of blood under them says it all."] = "Блять... лужа крови под ним говорит сама за себя."
ZC_RU.dict["Spine is severed. No neural control of heart."] = "Позвоночник перебит. Нет нервного контроля сердца."
ZC_RU.dict["Shit... they're broken in half..."] = "Блять... его переломило пополам..."
ZC_RU.dict["Heart is still beating. Defibrillation would induce arrest."] = "Сердце ещё бьётся. Дефибрилляция спровоцирует остановку."
ZC_RU.dict["This would kill the heart!"] = "Это убьёт сердце!"

-- Defib patient pain / cancel
ZC_RU.dict["MAKE IT STOP! THE BURNING!"] = "ПРЕКРАТИ! ЖЖЁТ!"
ZC_RU.dict["Please... no more... the electricity is unbearable..."] = "Пожалуйста... хватит... ток невыносим..."
ZC_RU.dict["AGH! The paddles... they're cooking me!"] = "АГХ! Электроды... меня жарят!"
ZC_RU.dict["I can't... I can't stay still... it BURNS!"] = "Не могу... не могу лежать... ЖЖЁТ!"
ZC_RU.dict["My chest... it BURNS!"] = "Грудь... ЖЖЁТ!"
ZC_RU.dict["The shock... it stopped my heart AGAIN..."] = "Разряд... снова остановил сердце..."
ZC_RU.dict["Please... PLEASE... don't leave me like this..."] = "Пожалуйста... ПОЖАЛУЙСТА... не бросай меня так..."

ZC_RU._lower_map = nil
ZC_RU._sorted_keys = nil
