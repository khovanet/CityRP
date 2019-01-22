WEAPON_REQSKILLS = {}
NUT_VOTE_TIME = 15
NUT_JOB_DELAY = 200
NUT_MIN_PRICE = 100
NUT_MAX_PRICE = 10000

-- 아이템 스킬 필요도 초기화 함수
local function addRequire(itemID, reqAttribs)
	WEAPON_REQSKILLS[itemID] =  reqAttribs
end

nut.currency.symbol = "$"
nut.currency.singular = ""
nut.currency.plural = ""
nut.config.language = "english"

-- ITEM SKILL REQUIREMENTS
--[[
	addRequire("ak47", {gunskill = 3})
	addRequire("aug", {gunskill = 5})
	addRequire("deagle", {gunskill = 5})
	addRequire("famas", {gunskill = 3})
	addRequire("fiveseven", {gunskill = 2})
	addRequire("galil", {gunskill = 3})
	addRequire("m4a1", {gunskill = 5})
	addRequire("mac10", {gunskill = 3})
	addRequire("mp5", {gunskill = 4})
	addRequire("p228", {gunskill = 1})
	addRequire("p90", {gunskill = 4})
	addRequire("sg552", {gunskill = 5})
	addRequire("tmp", {gunskill = 3})
	addRequire("ump", {gunskill = 3})
	addRequire("usp", {gunskill = 2})
	addRequire("healthkit", {medical = 7})
	addRequire("healvial", {medical = 3})
]]



	-- ALLOWED_ENTS
	-- Entities Listed below can be touch and tooled.
	ALLOWED_ENTS = {
		["prop_physics"] = true,
		["nut_item"] = true,
		["nut_d_lamp"] = true,
		["nut_punchbag"] = true,
		["nut_d_pot"] = true,
		["nut_shootbag"] = true,
		["nut_craftingtable"] = true,
		["nut_microwave"] = true,
		["nut_foodvendor"] = true,
		["nut_drinkvendor"] = true,
		["nut_helloboard"] = true,
		["rprotect_terminal"] = true,
		["rprotect_scanner"] = true,
		["rprotect_camera"] = true,
		["nut_checker"] = true,
		["sent_bingle_simplenoti"] = true,
		["sent_bingle_simplenoti_mdbig"] = true,
		["sent_bingle_simplenoti_orlong"] = true,
		["keypad"] = true,
		["nut_lawboard"] = true,
		["elevator"] = true,
		["gmod_lamp"] = true,
		["gmod_light"] = true,
		["gmod_button"] = true,
		["sammyservers_textscreen"] = true,
		["nut_stove"] = true,
		["nut_storage"] = true,
		["jukebox"] = true,
		["instrument_drumpad"] = true,
		["synthesizer"] = true,
		["synthesizer_guitar"] = true,
		["synthesizer_piano"] = true,
		["synthesizer_violin"] = true,
		["nut_emergency"] = true,

		["nut_vnd_soda"] = true,
		["nut_vnd_snack"] = true,
		["nut_vnd_popcorn"] = true,
		["nut_vnd_food"] = true,
		["nut_vnd_covfefe"] = true,
		["nut_vnd_covfefe_refill"] = true,
		["nut_seller"] = true,

		["frame_flag"] = true,
		["frame_rect_big"] = true,
		["frame_rect"] = true,
		["frame_hort"] = true,
		["nut_mapbeacon"] = true,

		["nut_vnd_medical"] = true,

		--------BITMINER 2
		["bm2_bitminer_1"] = true,
		["bm2_bitminer_2"] = true,
		["bm2_bitminer_rack"] = true,
		["bm2_bitminer_server"] = true,
		["bm2_extention_lead"] = true,
		["bm2_fuel"] = true,
		["bm2_generator"] = true,
		["bm2_power_lead"] = true,
	}

-- DEFAULT_PURCHASE
-- Default Purchasable list.
DEFAULT_PURCHASE = {
	-- Ammo
	["ammo_pistol"] = 1,
	["ammo_buckshot"] = 1,
	["ammo_357"] = 1,
	["ammo_smg1"] = 1,
	["keypad"] = 1,
}

-- DROPITEM
-- Drops specified items when player dies.
-- 1 means 100% chance to drop.
-- 0 means never drops the item
DROPITEM = {
	["raweed"] = 1,
}

-- ILLEGAL_ENTITY
ILLEGAL_ENTITY = {
	["printer_tier1"] = 0.8,
	["printer_tier2"] = 0.8,
	["printer_tier3"] = 0.8,
	["printer_tier4"] = 0.8,
	["printer_tier5"] = 0.8,
	["printer_tier6"] = 0.8,
	["printer_tier7"] = 0.8,
	["nut_d_lamp"] = 0.8,
	["nut_d_pot"] = 0.8,
}

WEEDTABLE = {
	price = 500,
	min = 0.7,
	max = 1.3,
}

-- Adding Schema Specific Configs.
nut.config.setDefault("font", "Bitstream Vera Sans")

nut.config.add("garbageInterval", 20, "How long trash regen takes.",
	function(oldValue, newValue)
		if (timer.Exists("nutGrabage")) then
			timer.Adjust("nutGrabage", newValue, 0, SCHEMA.CrapPayload)
		end
	end, {
	data = {min = 10, max = 3600},
	category = "schema"
})

nut.config.add("hitCost", 500, "Amount of money for requesting hit.", nil, {
	data = {min = 250, max = 5000},
	category = "schema"
})

nut.config.add("garbageMax", 25, "How many trash can be in single world.", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

nut.config.add("garbageCount", 7, "How many trash spawned in one tick.", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

nut.config.add("voteJob", 25, "Percentage of vote to get a job", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

nut.config.add("voteDemote", 25, "Percentage of vote to demote people", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

nut.config.add("wageInterval", 180, "Amount of seconds to distribute paycheck on players.",
	function(oldValue, newValue)
		if (timer.Exists("nutSalary")) then
			timer.Adjust("nutSalary", newValue, 0, SCHEMA.SalaryPayload)
		end
	end, {
	data = {min = 10, max = 3600},
	category = "schema"
})

nut.config.add("incomeInterval", 1000, "Amount of seconds to distribute bank income.",
	function(oldValue, newValue)
		if (timer.Exists("nutBankIncome")) then
			timer.Adjust("nutBankIncome", newValue, 0, SCHEMA.BankIncomePayload)
		end
	end, {
	data = {min = 10, max = 3600},
	category = "schema"
})

nut.config.add("doorTaxInterval", 300, "Amount of seconds to get door tax.",
	function(oldValue, newValue)
		if (timer.Exists("nutDoorTax")) then
			timer.Adjust("nutDoorTax", newValue, 0, SCHEMA.BuildingTaxPayload)
		end
	end, {
	data = {min = 1, max = 3600},
	category = "schema"
})

nut.config.add("jailTime", 200, "Amount of seconds.", nil, {
	data = {min = 0, max = 600},
	category = "schema"
})

nut.config.add("tazeTime", 5, "The ammount of time someone is tazed for.", nil, {
	data = {min = 0, max = 600},
	category = "schema"
})

nut.config.add("incomeRate", .1, "Percentage of income.", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

nut.config.add("dpBank", 10, "Percentage of Money to lose in Death Penalty.", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

nut.config.add("potPerLaw", 4, "Week Pot limit.", nil, {
	data = {min = 0, max = 10},
	category = "schema"
})

nut.config.add("bankFee", 5, "The Bank Transfer Fee (x% of Transfer Money).", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

nut.config.add("startMoney", 5000, "Start money for new character.", nil, {
	data = {min = 0, max = 50000},
	category = "schema"
})

nut.config.add("isSerious", false, "Turn on/off the serious mod of this schema", nil, {
	category = "schema"
})

nut.config.add("deathMoney", true, "Lose money on death.", nil, {
	category = "penalty"
})

nut.config.add("deathWeapon", true, "Lose weapon on death.", nil, {
	category = "penalty"
})
nut.config.add("afkDemote", 240, "afk Demote.", nil, {
	data = {min = 0, max = 1000},
	category = "schema"
})

nut.config.add("doorTax", 100, "door tax.", nil, {
	data = {min = 0, max = 1000},
	category = "schema"
})


-- yeah yeah i'm going to make this short, okay?
local function accesibleOnlyForJob(client, jobClass)
	local char = client:getChar()

	if (char) then
		local class = char:getClass()

		if (class != jobClass) then return end

		return true
	end

	return false
end

local function all(client) return true end
local function pianoOnly(client) return accesibleOnlyForJob(client, CLASS_PIANIST) end
local function djOnly(client) return accesibleOnlyForJob(client, CLASS_DEEJAY) end
local function cookOnly(client) return accesibleOnlyForJob(client, CLASS_COOK) end
local function docOnly(client) return accesibleOnlyForJob(client, CLASS_DOCTOR) end
local function hoboOnly(client) return accesibleOnlyForJob(client, CLASS_HOBO) end
local function busiOnly(client) return accesibleOnlyForJob(client, CLASS_BUSINESS) end
local function dealerOnly(client) 
	return (
		accesibleOnlyForJob(client, CLASS_BLACKDEALER) or
		accesibleOnlyForJob(client, CLASS_DEALER)
	)
end

local function mobOnly(client)
	local char = client:getChar()

	if (char) then
		local class = char:getClass()
		local classData = nut.class.list[class]

		if (!classData) then return end
		if (classData.team == 2 or classData.team == 3) then
			return true
		end

		return false
	end

	return
end


local function onlyLaw(client)
	local char = client:getChar()

	if (char) then
		local class = char:getClass()
		local classData = nut.class.list[class]

		if (!classData) then return end
		if (classData.law != true) then return end

		return true
	end

	return
end

local function notLaw(client)
	return not onlyLaw(client)
end

function nut.bent.add(entClass, entModel, entName, entMax, entPrice, buyCondition)
	local condt = buyCondition or defaultCond

	nut.bent.list[entClass] = {
		class = entClass,
		name = entName,
		model = entModel,
		max = entMax,
		price = entPrice,
		condition = condt
	}

	return nut.bent.list[entClass]
end

nut.bent.add("printer_tier1", "models/rebel1324/mprint.mdl", "printerNameTier1", 1, 20000, notLaw)
nut.bent.add("printer_tier2", "models/rebel1324/mprint.mdl", "printerNameTier2", 1, 30000, notLaw)
nut.bent.add("printer_tier3", "models/rebel1324/mprint.mdl", "printerNameTier3", 1, 50000, notLaw)
nut.bent.add("printer_tier4", "models/rebel1324/mprint.mdl", "printerNameTier4", 1, 70000, notLaw)
nut.bent.add("printer_tier5", "models/rebel1324/mprint.mdl", "printerNameTier5", 1, 85000, notLaw)
nut.bent.add("printer_tier6", "models/rebel1324/mprint.mdl", "printerNameTier6", 1, 100000, notLaw)
nut.bent.add("printer_tier7", "models/rebel1324/mprint.mdl", "printerNameTier7", 1, 130000, notLaw)
nut.bent.add("nut_vnd_food", "models/props_wasteland/kitchen_stove002a.mdl", "foodVendor", 1, 800, cookOnly)
nut.bent.add("nut_vnd_soda", "models/rebel1324/sodavendor.mdl", "sodaVendor", 1, 1000, cookOnly)
nut.bent.add("nut_vnd_covfefe", "models/props/commercial/coffeemachine01.mdl", "coffeeVendor", 1, 4500, cookOnly)
nut.bent.add("nut_microwave", "models/props/cs_office/microwave.mdl", "microwave", 2, 400, cookOnly)
nut.bent.add("nut_stove", "models/props_c17/furnitureStove001a.mdl", "stove", 1, 1500, cookOnly)
nut.bent.add("nut_hobocan", "models/props_junk/MetalBucket02a.mdl", "hoboCanName", 2, 3000, hoboOnly)
nut.bent.add("nut_attrib_gun", "models/props_c17/doll01.mdl", "gunBoosterName", 2, 3000, dealerOnly)
nut.bent.add("nut_vnd_medical", "models/rebel1324/medicvendor.mdl", "medicalVendorName", 1, 1000, docOnly)
nut.bent.add("synthesizer", "models/tnf/synths.mdl", "synthesizer", 1, 3000, pianoOnly)
nut.bent.add("synthesizer_guitar", "models/tnf/synth.mdl", "synthesizerGuitar", 1, 3000, pianoOnly)
nut.bent.add("synthesizer_piano", "models/tnf/synth.mdl", "synthesizerPiano", 1, 3000, pianoOnly)
nut.bent.add("synthesizer_violin", "models/tnf/synth.mdl", "synthesizerViolin", 1, 3000, pianoOnly)
nut.bent.add("nut_seller", "models/rebel1324/nmrih_cash_register.mdl", "checkoutName", 1, 2500, all)
nut.bent.add("nut_craftingtable", "models/props_wasteland/controlroom_desk001b.mdl", "craftingTable", 1, 10000, all)
nut.bent.add("sent_bingle_simplenoti", "models/props/cs_assault/chaintrainstationsign.mdl", "signSmall", 2, 400, all)
nut.bent.add("sent_bingle_simplenoti_orlong", "models/squad/sf_plates/sf_plate2x5.mdl", "signMedium", 2, 400, all)
nut.bent.add("sent_bingle_simplenoti_mdbig", "models/hunter/plates/plate1x3.mdl", "singBig", 2, 400, all)
nut.bent.add("nut_attrib_punch", "models/props_lab/huladoll.mdl", "strBoosterName", 2, 1000, all)
nut.bent.add("rprotect_terminal", "models/props_phx/rt_screen.mdl", "survTerminal", 1, 2000, all)
nut.bent.add("rprotect_scanner", "models/Items/battery.mdl", "survScanner", 4, 1500, all)
nut.bent.add("rprotect_camera", "models/tools/camera/camera.mdl", "survCamera", 1, 2000, all)
nut.bent.add("nut_mapbeacon", "models/props_combine/combine_mine01.mdl", "mapBeacon", 1, 2000, all)
nut.bent.add("frame_flag", "models/rebel1324/z018.mdl", "frameFlag", 1, 6500, all)
nut.bent.add("frame_rect_big", "models/rebel1324/painting_hexed_rect_big.mdl", "frameRectBig", 1, 4000, all)
nut.bent.add("frame_rect", "models/rebel1324/painting_hexed_rect.mdl", "frameRect", 1, 2000, all)
nut.bent.add("frame_hort", "models/rebel1324/painting_hexed.mdl", "frameHort", 1, 2000, all)

nut.tips = {
	--'대부분의 아이템은 Ctrl을 누르고 클릭하면 바로 사용할 수 있습니다.',
	'Remember, your salary is automatically deposited into your bank account. Make sure to bring cash!',
	'Did you know? The inventory can also be opened directly by pressing \'F3\'.',
	'Reptitive actions will help train your skills.',
	'Did you know? Punching-bag dolls will train your strength skill when hit.',
	'Did you know? Reading books are great for boosting your stats!',
	'If you\'d like, you can hide these tips via the quick settings. These can be found by holding \'C\' and clicking the gear in the upper right hand corner.',
	'Did you know? Shooting target dolls will train your firearms skill.',
	'Certain traders will only sell things to you if you have the right job.',
	'Did you know? Mobsters, gangsters, and police can communicate with eachother directly using the \'/team\' command.',
	'Bug reports are resolved much quicker if you attach an image or video.',
	'Did you know? You can earn ssome extra money using money printers.',
	'Police receive rewards for confiscating money printers.',
	'Please separate in-character chat and out of character chat!',
	'Please check MOTD and IC / OOC before asking for help.',
	'Having an issue? You can file a report with an administrator using the report command.',
}

hook.Run("OnRegisterPurchaseList")