--------------------------------------------------------------------
-- PLG English Localization
--------------------------------------------------------------------

PLG["enUS"] = {
	["errors"] = {
		["ERR_DATA"]       = "Data not found. PLG is closing.",
		["ERR_LEARN"]      = "Go to your trainer and learn the following recipe:",
		["ERR_LEARNVEND"]  = "Go to the vendor listed below and obtain the following recipe:",
		["ERR_LOW_LEVEL"]  = "You must be level %s to use the following recipe:",
		["ERR_NOT_FOUND"]  = "The recipe could not be found on the server.  Please use an alternate recipe to level.",
		["ERR_MAX_LEVEL"]  = "Max Level, No more recipes. PLG is closing.",
		["ERR_MAX_SKILL"]  = "You have reached the max skill for this level. Go see your trainer.",	
	},	
	["app"] = {
		["APP_NAME"]       = "PLG", 
		["APP_TITLE"]      = "Profession Leveling Guide", 
		["BTN_RESET_NAME"] = "Reset Guide Data", 
		["BTN_RESET_TIP"]  = "This will clear any saved guide data and reload your User Interface.", 
		["MSG_TRAINER"]    = "Go see your trainer!", 
		["MSG_DRAENOR"]    = "Obtain ", 
		["MSG_WAITING"]    = "Waiting for server...", 
		["DBG_NAME"]       = "PLG Debugging", 
		["DBG_DESC"]       = "Click to imitate profession leveling.", 
	},	
	["tab1"] = {
		["TAB_TITLE"]      = "Guide", 
		["TAB_TOOLTIP"]    = "Click to show the guide.", 
		["PAG_TITLE"]      = "Instructions", 
		["TXT_CREATE"]     = "Create %s of the following recipe until skill level %s.",
		["TXT_KEEP"]       = "You will need to keep these for future recipes.",	
		["LBL_RECIPE"]     = "Recipe", 
		["LBL_ALTERNATE"]  = "Alternate", 
		["LBL_REAGENTS"]   = "Reagents", 
		["TIP_SELECT"]     = "(Click to select)", 
		["TIP_Q1_TITLE"]   = "Recipe Quest", 
		["TIP_Q1_DESC"]    = "This recipe must be obtained through the above quest chain.  The quest giver and location are listed below. ", 
		["TIP_Q_LEVEL"]    = "Requires Level", 
		["TIP_Q2_TITLE"]   = "Prerequisite Quest", 
		["TIP_Q2_DESC"]    = "This quest chain must be completed first.  The quest giver and location are listed below.", 
		["TIP_V_TITLE"]    = "Recipe Vendor", 
		["TIP_V_DESC"]     = "This recipe must be obtained through a vendor.  The vendor and location are listed below. ", 
		["TIP_NPC"]        = "NPC", 
		["TIP_LOCATION"]   = "Location", 
		["TIP_WAYPOINT"]   = "Click to set a waypoint.", 
	},	
	["tab2"] = {
		["TAB_TITLE"]      = "Alternates", 
		["TAB_TOOLTIP"]    = "Click to show a list of alternate recipes.", 
		["PAG_TITLE"]      = "Alternate Recipes", 
		["PAG_DESC"]       = "\n\nThe following list of recipes may be used as alternatives to the guide suggestions and will change as you level.  Left-Click to replace the primary recipe, Right-Click to replace the alternate recipe.", 
		["MSG_REPLACE_PRIMARY"]   = "Replace primary recipe with %s?", 
		["MSG_REPLACE_ALTERNATE"] = "Replace alternate recipe with %s?", 
		["MSG_RELOAD"]            = "Do you want to continue?", 
	},
	["tab3"] = {
		["TAB_TITLE"]      = "Reagents", 
		["TAB_TOOLTIP"]    = "Click to show a list of all reagents required.", 
		["PAG_TITLE"]      = "Reagent Shopping List", 
		["PAG_DESC"]       = "\n\nThe following list contains the number of reagents needed to level this profession and will change as you level.  This is only an approximation based on the data.  For example: if you get no skill-ups while crafting a green or yellow recipe, there will be a need to buy, farm, or craft more reagents until you do get a skill-up.", 
	},
	["tab4"] = {
		["TAB_TITLE"]      = "Help", 
		["TAB_TOOLTIP"]    = "Click to show the help screen.", 
		["PAG_TITLE"]      = "PLG Help", 
		["PAG_DESC"]       = "\n\n|cff000000INSTRUCTIONS:|r\nThe instructions text will provide important information such as how many of a pattern or recipe to create, or when and where to learn a new recipe.  \n\n|cff000000RECIPES:|r\nPLG will switch to a new recipe determined by your current skill level. Sometimes an alternate recipe will be displayed.  Click it to display the alternate recipe's reagents. Recipes that are not selected will appear to be shaded. Below each recipe is a color bar to indicate the difficulty level of the recipe.  \n\n|cff000000REAGENTS:|r\nThe guide will display the total number of reagents needed to complete a level. For example, to make one elixir you need one vial.  To get to the next level you need 5 elixirs. The guide will tell you to obtain 5 vials.    \n\n\n|cff000000VENDORS:|r\nSometimes a recipe must be obtained somewhere other than your trainer.  An icon will be shown  next to the primary recipe for a vendor |T"..PLG.textures.VENDORRECIPE..":16|t or quest chain |T"..PLG.textures.QUESTRECIPE..":16|t.  The tooltip of this icon will display the quest name (if necessary), vendor, and vendor location.  Clicking the icon will set a waypoint in TomTom or Carbonite to direct you to the vendor or quest giver. \n\n|cff000000OTHER NOTES:|r\n* Any item that can be clicked will cause the cursor to glow blue. \n\n* Each recipe, if known, will be selected automatically in the trade skill window.\n\n* Once you reach the max skill level for a profession, this guide will no longer display for that profession.\n\n* 25 points prior to reaching the max skill points for your level, orange text at the top of the window will warn you that you need to visit your trainer.\n\n|cff000000GOOD LUCK!", 
		["DRAENOR_TITLE"]    = "\n\n|cff000000DRAENOR PROFESSIONS:|r\n",
		["TXT_PRE_DRAENOR"]  = "Before you can level this profession further, you must obtain the recipe listed above.  Primary profession recipes can be purchased from vendors in Ashran, your Garrison profession building, or obtained as a reward from a quest drop.  Secondary profession recipes are usually obtained by fishing, gathering, cooking, or even by eating food.";
		["TXT_POST_DRAENOR"] = "Build your Garrison profession buildings and start creating work orders as soon as you can.  Work orders will take raw materials and return to you the primary and secondary crafting reagents for your profession every 4 hours.  In addition to the recipes in this guide, there are two recipes for each primary profession that can be crafted once daily.  Make sure you craft these to get the materials and the skill-ups provided.";
	},
	["help"] = {	
		["Alchemy"]        = "\n\n|cff000000ALCHEMY:|r\nThis profession is best combined with Herbalism, you can save a lot of gold if you level these two professions together because you can farm all the needed herbs.",
		["Blacksmithing"]  = "\n\n|cff000000BLACKSMITHING:|r\nThis profession is best combined with Mining, you can save a lot of gold if you level these two professions together because you can farm all the needed metals.",
		["Cooking"]        = "\n\n|cff000000COOKING:|r\nThe simplest way to level cooking if you are below level 85 is to participate in the Pilgrim's Bounty world event.  In this one event you can level cooking from 1 to around 350 and become a Grand Master.  At level 85 you can go to Halfhill Market in Pandaria and talk to Sungshin Ironpaw.  There you can level cooking from 1-600. If you wish to level cooking as you play, then use this guide.",
		["Enchanting"]     = "\n\n|cff000000ENCHANTING:|r\nThis profession is best combined with Tailoring, as you can disenchant most of the cloths you create.",
		["Engineering"]    = "\n\n|cff000000ENGINEERING:|r\nThis profession is best combined with Mining, you can save a lot of gold if you level these two professions together because you can farm all the needed metals.",
		["Inscription"]    = "\n\n|cff000000INSCRIPTION:|r\nThis profession is best combined with Herbalism, you can save a lot of gold if you level these two professions together because you can farm all the needed herbs.",
		["Jewelcrafting"]  = "\n\n|cff000000JEWELCRAFTING:|r\nThis profession is best combined with Mining or Enchanting, you can save a lot of gold if you level these two professions together because you can either farm all the needed materials, or disenchant what you make.",
		["Leatherworking"] = "\n\n|cff000000LEATHERWORKING:|r\nThis profession is best combined with Skinning, you can save a lot of gold if you level these two professions together because you can farm all the needed materials.",
		["Tailoring"]      = "\n\n|cff000000TAILORING:|r\nYou will need thousands of cloths if you want to level Tailoring. It will cost thousands of gold to buy the cloths, or if you farm them, it will take a lot of time to farm everything. Tailoring is good combined with Enchanting because you will be able to disenchant most items you create.",
	},
}