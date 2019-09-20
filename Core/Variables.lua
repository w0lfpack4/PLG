--------------------------------------------------------------------
-- PLG Variables
--------------------------------------------------------------------

---------------------------
-- core
---------------------------
PLG = {}

---------------------------
-- debug leveling variables (test the data)
---------------------------
PLG.debug = false   -- imitate profession leveling
PLG.screenshot = false  -- turn off debugging tells for screenshots
PLG.debugProfession = "Blacksmithing"
PLG.debugEarned = 420
PLG.debugTotal = 425

---------------------------
-- debug messaging variables ( test the functions)
---------------------------
PLG.verbose = false -- display ALL debugging messages

---------------------------
-- debug localization variables ( test the localization)
---------------------------
PLG.debugLocalization = false
PLG.debugLocale = "deDE"

---------------------------
-- variables
---------------------------
PLG.lastSID = 0
PLG.maxLevel = 600
PLG.pFaction = UnitFactionGroup("player")
PLG.pLevel = UnitLevel("player")
PLG.Professions = { GetProfessions() }
PLG.selectedRecipe = 1
PLG.timer1 = 0
PLG.timer5 = 0
PLG.tooltip = CreateFrame("GameTooltip","PLG_Tooltip",UIParent,"GameTooltipTemplate")

---------------------------
-- switches
---------------------------
PLG.loaded = false
PLG.newRecipe = false
PLG.waitForServer = false
PLG.UseWayPoint = nil
PLG.updating = nil

---------------------------
-- events
---------------------------
PLG.events = {
	"CHAT_MSG_SKILL",
	"SKILL_LINES_CHANGED",
	"TRADE_SKILL_UPDATE",
	"TRADE_SKILL_SHOW",
	"TRADE_SKILL_CLOSE",
	"BAG_UPDATE",
}

---------------------------
-- colors
---------------------------
PLG.colors = {
	["BLACK"]     = "|cFF000000",
	["DARKGRAY"]  = "|cFF333333",
	["BLUE"]      = "|cFF69CCF0",
	["GRAY"]      = "|cff8F8F8F",
	["ORANGE"]    = "|cffff7700",
	["GREEN"]     = "|cff00ff00",
	["YELLOW"]    = "|cffffff00",
	["WHITE"]     = "|cffffffff",
	["RGB"]       = {
		["WHT"] = { 1, 1, 1 },
		["GRY"] = { .5, .5, .5 },
		["GRN"] = { .3, 1, .3 },
		["GLD"] = { .9, .7, .2 },
		["YEL"] = { 1, 1, 0 },
		["BLU"] = { 0, .4, 1 },
		["LBL"] = { .4, .8, .94 },
		["RED"] = { 1, 0, 0 },
		["PPL"] = { .6, 0, .8 },
		["ORA"] = { 1, .46, 0 },
		["BLK"] = { 0, 0, 0 },
		["DGY"] = { .2, .2, .2 },
		["BRN"] = { .24, .16, .11 },
	},
}

---------------------------
-- textures
---------------------------
PLG.textures = {
	["TSRFBON"]       = "Interface\\AddOns\\PLG\\Images\\BarBorder.tga",
	["TSRFBOFF"]      = "Interface\\PaperDollInfoFrame\\UI-Character-Skills-BarBorder",
	["BORDER"]        = "Interface\\AddOns\\PLG\\Images\\VerticalBar.tga",
	["HELPUP"]        = "Interface\\BUTTONS\\UI-MicroButton-Help-Up",
	["HELPDOWN"]      = "Interface\\BUTTONS\\UI-MicroButton-Help-Down",
	["HELPDEBUGUP"]   = "Interface\\BUTTONS\\UI-MicroStream-Green",
	["HELPDEBUGDOWN"] = "Interface\\BUTTONS\\UI-MicroStream-Red",
	["PORTRAIT_ORIG"] = "Interface\\CHARACTERFRAME\\TempPortrait",
	["PORTRAIT"]      = "Interface\\AddOns\\PLG\\Images\\title",
	["SCROLLBAR"]     = "Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar",
	["BACKGROUND"]    = "Interface\\QuestFrame\\QuestBG",
	["QUESTRECIPE"]   = "Interface\\ICONS\\INV_Scroll_04",
	["VENDORRECIPE"]  = "Interface\\ICONS\\INV_Scroll_06",
	["BACKDROP"]      = "Interface\\Tooltips\\UI-Tooltip-Border",
}

---------------------------
-- Professions
---------------------------
PLG.ProfessionNames = {
	[129] = "First Aid",
	[164] = "Blacksmithing",
	[165] = "Leatherworking",
	[171] = "Alchemy",
	--[182] = "Herbalism",
	[185] = "Cooking",
	--[186] = "Mining",
	[197] = "Tailoring",
	[202] = "Engineering",
	[333] = "Enchanting",
	--[356] = "Fishing",
	--[393] = "Skinning",
	[755] = "Jewelcrafting",
	[773] = "Inscription",
	--[794] = "Archaeology",
	-- Runecrafting is nil
}

-- skillup colors
PLG.SkillType = { 
	["easy"]    = { r = 0.25, g = 0.75, b = 0.25, h = "|cff00ff00", },
	["medium"]  = { r = 1.00, g = 1.00, b = 0.00, h = "|cfffff000", },
	["optimal"] = { r = 1.00, g = 0.50, b = 0.25, h = "|cffff7700", },
	["trivial"] = { r = 0.50, g = 0.50, b = 0.50, h = "|cffcfcfcf", },
}

-- racial buffs
PLG.Racial = {-- spellid, added skill points
	[185] = {107073,15}, -- cooking
	[755] = {28875,10},  -- jewelcrafting
	[202] = {20593,15},  -- engineering
	[333] = {28877,10},  -- enchanting (may be removed in warlords)
	[171] = {69045,15},  -- alchemy
}
