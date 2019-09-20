--------------------------------------------------------------------
-- PLG Data Functions
--------------------------------------------------------------------

---------------------------
-- get leveling data
---------------------------
function PLG:getData()
	PLG:Debug("Function","getData")
	local pSL, pEarned, pTotal, racial = unpack(PLG:getProfession())
	local data = PLG.Data[PLG.ProfessionNames[pSL]] -- dataset	
	PLG:Debug("getData","pSL="..tostring(pSL))
	PLG:Debug("getData","Profession="..tostring(PLG.ProfessionNames[pSL]))
	local sID1, sID2, npcID, quest1, Keep = nil,nil,nil,nil,nil
	if pEarned < PLG.maxLevel and data then
		-- load stored data
		for i=#data, 1, -1 do
			-- minlevel, maxlevel, recipe id, optional id, vendor type, vendor id both, vid horde, vid alliance
			local keep, sMin, sMax, rID1, rID2, vType, fIDb, fIDh, fIDa = unpack(data[i])
			if (pEarned >= (sMin + racial)) and (pEarned < (sMax + racial)) then -- earned greater than min AND earned less than max
				PLG:Debug("Condition","recipe found: "..tostring(rID1))
				sID1 = rID1 -- recipe/skill id
				sID2 = rID2 -- recipe/skill id
				sTotal = (data[i][3] + racial)
				if vType == 1 then -- vendor
					npcID = fIDb
					if not npcID then npcID = PLG:getCondition(PLG.pFaction == "Horde", fIDh, fIDa) end
				elseif vType == 2 then -- quest
					quest1 = fIDb
				end
				Keep = keep
			end
		end
	end
	return { {sID1, sID2}, Keep, npcID, quest1, sTotal, pEarned, pTotal }
end

---------------------------
-- get recipe info
---------------------------
function PLG:getRecipe(sID)
	PLG:Debug("Function","getRecipe")
	local sName, sLink, sIcon, minLevel = nil, nil, nil, 1
	if sID then
		local lID = strfind(tostring(sID), "s") or 0
		if lID > 0 then -- data item is a spell
			local val,_ = string.gsub(tostring(sID), "s", "")
			sID = tonumber(val)
			sName, _, sIcon, _ = GetSpellInfo(sID)
			sLink, _ = GetSpellLink(sID)
			PLG:Debug("Condition","spell found: "..tostring(sLink))
		else
			sName, sLink, _, _, minLevel, _, _, _, _, sIcon, _ = GetItemInfo(sID)
			PLG:Debug("Condition","item found: "..tostring(sLink))
		end
	end
	return { sName, sLink, sIcon, minLevel or 1 }
end

---------------------------
-- get reagent info
---------------------------
function PLG:getReagents(recipe,need)
	PLG:Debug("Function","getReagents")
	for j=1,GetTradeSkillNumReagents(recipe) do -- get reagents
		local rName, rIcon, rCount, pCount = GetTradeSkillReagentInfo(recipe, j);
		local rLink = GetTradeSkillReagentItemLink(recipe, j)
		if rName ~= nil then
			PLG:setReagent(j,rName,pCount.."/"..(rCount*need),rIcon,rLink)
		end
	end
end

---------------------------
-- get profession info
---------------------------
function PLG:getProfession()
	PLG:Debug("Function","getProfession")
	local Profession, _ = GetTradeSkillLine() -- PLG:TradeSkillTitle() -- frame title
	PLG:Debug("getProfession","Profession="..tostring(Profession))
	local pSL = nil
	if PLG.debug== true then Profession = PLG.debugProfession end
	local pEarned, pTotal, racial = 0,0,0
	-- check professions, TradeSkillDW loads me too early
	if #PLG.Professions == 0 then PLG.Professions = { GetProfessions() } end
	for i=1, #PLG.Professions do		
		if PLG.Professions[i] ~= nil then
			local pName, _, earned, total, _, _, skillLine, _ = GetProfessionInfo(PLG.Professions[i])
			if pName == Profession then -- earned/total ranks for profession
				PLG:Debug("Condition","profession found: "..tostring(Profession))
				pEarned = earned
				pTotal = total
				pSL = skillLine
				--if pSL == 185 then pSL = 186 end  (fake cooking = smelting)
			end
		end
	end
	if PLG.debug== true then 
		pEarned = PLG.debugEarned; 
		pTotal = PLG.debugTotal; 
		for k,v in pairs(PLG.ProfessionNames) do 
			if v == Profession then
				pSL = k
				PLG:Debug("Condition","profession faked")
				break
			end
		end
	end
	-- racial buffs
	if pSL and PLG.Racial[pSL] ~= nil then
		if IsSpellKnown(PLG.Racial[pSL][1]) == true then
			PLG:Debug("Condition","racial trait found")
			--racial = PLG.Racial[pSL][2]
		end
	end
	return {pSL, pEarned, pTotal, racial}
end
