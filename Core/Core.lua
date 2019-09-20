--------------------------------------------------------------------
-- PLG Core Functions
--------------------------------------------------------------------

---------------------------
-- update the data
---------------------------
function PLG:TRADE_SKILL_UPDATE(selected)  --224/225 225/300
	if not PLG.updating then
		PLG:Debug("Function","TRADE_SKILL_UPDATE")
		PLG.updating = true
		PLG:resetDisplay()
		local sID, keep, npcID, questID, sTotal, pEarned, pTotal = unpack(PLG:getData())
		if sID[1] and PLG.lastSID ~= sID[1] then -- if primary recipe not nil and primary is different than the last
			PLG.lastSID = sID[1]
			PLG.selectedRecipe = 1
			PLG.newRecipe = true
		end
		local hasSkill = nil
		if pEarned == pTotal then -- need to train
			if pTotal == PLG.maxLevel or pTotal == 1 then -- max out (should never hit this)
				PLG:Debug("Condition","earned=total=max")
				PLG:setText("Instructions_Text",PLG.msgs.ERR_MAX_LEVEL)
			else --max on this level
				PLG:Debug("Condition","earned=total")
				PLG:setText("Instructions_Text",PLG.msgs.ERR_MAX_SKILL)
				PLG:setText("Trainer",PLG.msgs.TRAINER)
			end
		else
			if not sID[1] then PLG:Debug("Condition",PLG.msgs.ERR_DATA); PLG:TRADE_SKILL_CLOSE(); return; end
			if pEarned > pTotal-25 then -- able to train
				PLG:Debug("Condition","earned=total-25")
				PLG:setText("Trainer",PLG.msgs.TRAINER)
			end		
			if questID then -- quest tooltip
				PLG:setTooltip(PLG.labels.QUEST,function() PLG:getQuest(questID) end, questID)
			elseif npcID then -- vendor tooltip
				PLG:setTooltip(PLG.labels.NPC,function() PLG:getNPC(npcID) end, npcID)
			end
			for list=1,2 do
				local id = sID[list]
				local sName, sLink, sIcon, minLevel = unpack(PLG:getRecipe(id))
				if sName then
					--if (PLG.pLevel >= minLevel) or PLG.debug then -- high enough level for this skill? or bypass if debugging
						for i=1, GetNumTradeSkills() do
							local skillName, skillType, _, _, _, numSkillUps, _ = GetTradeSkillInfo(i)
							if sName == skillName then	
								PLG:Debug("Condition","data matches skill"..list)	
								if not numSkillUps or numSkillUps < 1 then numSkillUps = 1 end -- can be 0 and gives a NaN result on division
								local skillUpsLeft = (sTotal-pEarned)
								local need = math.floor(skillUpsLeft/numSkillUps) -- needed skillups till next recipe
								if skillUpsLeft < numSkillUps then need = 1 end -- need 1 point with a 5 skillup...
								if keep > 0 then
									PLG:setText("Instructions_Text",PLG.msgs.CREATE.." "..PLG.msgs.KEEP,need,sTotal)
								else
									PLG:setText("Instructions_Text",PLG.msgs.CREATE,need,sTotal)
								end
								PLG:setRecipe(list,sName,PLG.SkillType[skillType],sIcon,sLink)	
								if PLG.selectedRecipe == list then 
									hasSkill = true
									PLG:getReagents(i,need)
									if (PLG.newRecipe == true) or (PLG.selectedRecipe == selected) then
										PLG.TradeSkillFrame_SetSelection(i)
										PLG.TradeSkillFrame_Update();
										PLG.newRecipe = false
									end
								end
								break
							end
						end
						if not hasSkill then -- has not learned the skill
							if PLG.debug == true then
								local need = math.floor(sTotal-pEarned) -- needed skillups till next recipe
								if keep > 0 then
									PLG:setText("Instructions_Text",PLG.msgs.CREATE.." "..PLG.msgs.KEEP,need,sTotal)
								else
									PLG:setText("Instructions_Text",PLG.msgs.CREATE,need,sTotal)
								end
								PLG:setRecipe(list,sName,nil,sIcon,sLink)							
								if PLG.selectedRecipe == list then 
									if PLG.newRecipe == true then
										PLG:TradeSkillFrame_Update();
										PLG.newRecipe = false
									end
								end
							else
								PLG:Debug("Condition","unknown recipe")
								if questID or npcID then
									PLG:setText("Instructions_Text",PLG.msgs.ERR_LEARNVEND)
								else
									PLG:setText("Instructions_Text",PLG.msgs.ERR_LEARN)
								end
								PLG:setRecipe(list,sName,nil,sIcon,sLink)
							end
						end
					--else -- not high enough level (should never hit this.. I think...)
					--	PLG:Debug("Condition","high-level recipe")
					--	PLG:setText("Instructions_Text",PLG.msgs.ERR_LOW_LEVEL, minLevel)
					--	PLG:setRecipe(list,sName,nil,sIcon,sLink)
					--end
				else
					if list==1 then
						PLG:setText("Instructions_Text",PLG.msgs.WAITING)
						PLG:resetTooltip()
						PLG.waitForServer = true
					end
				end
			end
		end
		PLG.updating = nil
	end
end

---------------------------
-- on show event handler
---------------------------
function PLG:TRADE_SKILL_SHOW(force)	
	PLG:Debug("Function","TRADE_SKILL_SHOW")
	PLG.selectedRecipe = 1
	local PSL, pEarned, pTotal, racial = unpack(PLG:getProfession())
	-- not maxed, not runeforging, not mining, not herbalism, not fishing, not skinning, not archaeology
	-- this is all the logic for show/hide
	if ((pEarned < PLG.maxLevel) and (pTotal > 1) and (PSL ~= 182 and PSL ~= 186 and PSL ~= 356 and PSL ~= 393 and PSL ~= nil)) or force then 
		PLG:Debug("Condition","still leveling")
		PLG:setHelpText()
		PLG.backframe:Show()
		PLG.newRecipe = true
		PLG:TRADE_SKILL_UPDATE()	
	end
end

---------------------------
-- on close event handler
---------------------------
function PLG:TRADE_SKILL_CLOSE()
	PLG:Debug("Function","TRADE_SKILL_CLOSE")	
	PLG.backframe:Hide()
	PLG.updating = false
end

---------------------------
-- register events
---------------------------
function PLG:RegisterEvents()
	PLG:Debug("Function","RegisterEvents")
	for i=1, #PLG.events do
		PLG.frame:RegisterEvent(PLG.events[i])
	end
end

---------------------------
-- localization
---------------------------
function PLG:Localize()
	local locale = GetLocale()
	if PLG.debugLocalization then locale = PLG.debugLocale end
	if locale == "enGB" then locale = "enUS" end -- GB defaults to US
	if PLG[locale] then -- if localized for this region
		PLG.msgs = PLG[locale].msgs
		PLG.labels = PLG[locale].labels
		PLG.tooltips = PLG[locale].tooltips
		PLG.help = PLG[locale].help
	else -- default to enUS
		PLG.msgs = PLG["enUS"].msgs
		PLG.labels = PLG["enUS"].labels
		PLG.tooltips = PLG["enUS"].tooltips
		PLG.help = PLG["enUS"].help
	end
end

---------------------------
-- init
---------------------------
function PLG:Initialize()
	-- localize, must be first thing called
	PLG:Localize()
	PLG:Debug("Function","Initialize")
		
	-- check for addons	
	PLG:checkAddons()
		
	-- run addon commands before create frame
	PLG:addonInit()
	
	-- initialize
	PLG:createDataFrame()
	PLG:createHelpFrame()
	
	-- run addon commands after create frame
	PLG:addonLoad()
	
	PLG:createLabels()	
	PLG:RegisterEvents()	
	PLG.frame:Show()
	
		
	-- timers
	PLG.frame:SetScript("OnUpdate", function(self, elapsed)	
		PLG.timer1 = PLG.timer1 + elapsed
		PLG.timer5 = PLG.timer5 + elapsed
		-- 1 second timer
		if PLG.timer1 >= 1 then
			PLG.timer1 = 0	
			-- handle special addon needs
			PLG:addonTimer()
		end
		-- 5 second timer
		if PLG.timer5 >= 5 then
			PLG.timer5 = 0
			if PLG.waitForServer == true then
				PLG:TRADE_SKILL_UPDATE()
				PLG.waitForServer = false
			end
		end
	end)
			
	-- handle events
	PLG.frame:SetScript("OnEvent", function(self, event, arg1)
		PLG:Debug("OnEvent",event)
		--print(event)
		-- on open
		if event == "TRADE_SKILL_SHOW" then
			PLG:TRADE_SKILL_SHOW()
		-- on close
		elseif event == "TRADE_SKILL_CLOSE" then
			PLG:TRADE_SKILL_CLOSE()
		-- on update
		else
			-- call update if tradeskillframe and plg.frame are up
			if ( PLG.TradeSkillFrame:IsShown() ) and ( PLG.frame:IsShown() ) then
				if not PLG.updating then PLG:TRADE_SKILL_UPDATE() end
			end
			-- first run we miss _SHOW so call it
			if event == "TRADE_SKILL_UPDATE" and (not PLG.loaded) then
				PLG:TRADE_SKILL_SHOW()
				PLG.loaded = true
			end
		end
	end)
	
		
	-- call once to hide frames on load	
	PLG:TRADE_SKILL_CLOSE()
end

---------------------------
-- slash commands
---------------------------
SLASH_PLG1 = "/PLG"
SlashCmdList["PLG"] = function (msg, editBox)
	msg = string.lower(msg)
	if msg == "debug prof" then
		if PLG.debug == false then
			PLG.debug = true
			PLG:sendMSG("Debug Profession '"..PLG.debugProfession.."' ("..PLG.debugEarned.."/"..PLG.debugTotal.."): on")
		else
			PLG.debug = false
			PLG:sendMSG("Debug Profession: off")
		end
	elseif msg == "debug lang" then
		if PLG.debugLocalization == false then
			PLG.debugLocalization = true
			PLG:Localize()
			PLG:sendMSG("Debug Localization ("..PLG.debugLocale.."): on")
		else
			PLG.debugLocalization = false
			PLG:Localize()
			PLG:sendMSG("Debug Localization: off")
		end
	elseif msg == "debug verb" then
		if PLG.verbose == false then
			PLG.verbose = true
			PLG:sendMSG("Debug Verbose: on")
		else
			PLG.verbose = false
			PLG:sendMSG("Debug Verbose: off")
		end
	else
		if ( PLG.frame:IsShown() ) then
			PLG:TRADE_SKILL_CLOSE()
			PLG:sendMSG("is hidden")
		else
			PLG:TRADE_SKILL_SHOW(true)
			PLG:sendMSG("is visible")
		end
	end
end

---------------------------
-- launch
---------------------------
PLG:Initialize()