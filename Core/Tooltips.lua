--------------------------------------------------------------------
-- PLG Tooltip Functions
--------------------------------------------------------------------

---------------------------
-- get quest data
---------------------------
function PLG:getQuest(id)
	PLG:Debug("Function","getQuest")
	local quest1, NPC1, npc1h, npc1a, quest2, NPC2, npc2h, npc2a = unpack(PLG.Vendors[2][id]) -- get quest data
	if not NPC1 then NPC1 = PLG:getCondition(PLG.pFaction == "Horde", npc1h, npc1a) end -- get NPC1 ID
	if not NPC2 then NPC2 = PLG:getCondition(PLG.pFaction == "Horde", npc2h, npc2a) end -- get NPC2 ID
	PLG:Tooltip(PLG.tooltips.QUEST1TITLE)
	PLG:Tooltip()
	PLG:Tooltip(quest1,nil,"YEL")
	PLG:Tooltip(PLG.tooltips.QUEST1,nil,"WHT",nil,1)
	if NPC1 then
		PLG:Tooltip()
		local name, faction, location, x, y = unpack(PLG.Vendors[1][NPC1]) -- get NPC data
		PLG:Tooltip(PLG.tooltips.NPC, name, "WHT","GRN")
		PLG:Tooltip(PLG.tooltips.LOCATION, GetMapNameByID(location)..PLG.colors.WHITE.." ("..x..","..y..")", "WHT", "LBL")
	end
	if quest2 then
		PLG:Tooltip()
		PLG:Tooltip(PLG.tooltips.QUEST2TITLE,nil,"GLD")
		PLG:Tooltip()
		PLG:Tooltip(quest2,nil,"YEL")
		PLG:Tooltip(PLG.tooltips.QUEST2,nil,"WHT",nil,1)
	end
	if NPC2 then
		PLG:Tooltip()
		local name, faction, location, x, y = unpack(PLG.Vendors[1][NPC2]) -- get NPC data
		PLG:Tooltip(PLG.tooltips.NPC, name, "WHT","GRN")
		PLG:Tooltip(PLG.tooltips.LOCATION, GetMapNameByID(location)..PLG.colors.WHITE.." ("..x..","..y..")", "WHT", "LBL")
	end
end

---------------------------
-- get npc data
---------------------------
function PLG:getNPC(id)
	PLG:Debug("Function","getNPC")
	local name, faction, location, x, y = unpack(PLG.Vendors[1][id]) -- get NPC data
	PLG:Tooltip(PLG.tooltips.VENDOR)
	PLG:Tooltip(PLG.tooltips.VENDOR1,nil,"WHT",nil,1)
	PLG:Tooltip()
	PLG:Tooltip(PLG.tooltips.NPC, name, "WHT","GRN")
	PLG:Tooltip(PLG.tooltips.LOCATION, GetMapNameByID(location)..PLG.colors.WHITE.." ("..x..","..y..")", "WHT", "LBL")
end

---------------------------
-- set quest/npc link/tooltip
---------------------------
function PLG:setTooltip(text, func, id)
	PLG:Debug("Function","setTooltip")
	if text == PLG.labels.QUEST then
		_G["PLG_Vendor_Button"]:SetNormalTexture(PLG.textures.QUESTRECIPE)
	else
		_G["PLG_Vendor_Button"]:SetNormalTexture(PLG.textures.VENDORRECIPE)
	end
	_G["PLG_Vendor_Button"]:SetScript("OnEnter",function() 
		if PLG.UseWayPoint then
			SetCursor("CAST_CURSOR")
		end
		PLG.tooltip:ClearLines()
		PLG.tooltip:ClearAllPoints()
		PLG.tooltip:SetOwner(_G["PLG_Vendor_Button"],"ANCHOR_NONE")
		PLG.tooltip:SetPoint("BOTTOMLEFT", _G["PLG_Vendor_Button"], "TOPLEFT", 0, 0)	
		func()
		if PLG.UseWayPoint then
			PLG:Tooltip()
			PLG:Tooltip(PLG.tooltips.WAYPOINT,nil,"ORA")
		end
		PLG.tooltip:Show()
	end)
	_G["PLG_Vendor_Button"]:SetScript("OnLeave",function() 
		SetCursor("POINT_CURSOR")
		PLG.tooltip:Hide()
	end)
	if PLG.UseWayPoint then
		_G["PLG_Vendor_Button"]:SetScript("OnClick",function() 
			if text == PLG.labels.QUEST then		
				local quest1, NPC1, npc1h, npc1a, _ = unpack(PLG.Vendors[2][id]) -- get quest data
				if not NPC1 then NPC1 = PLG:getCondition(PLG.pFaction == "Horde", npc1h, npc1a) end -- get NPC1 ID
				id = NPC1
			end
			local name, faction, location, x, y = unpack(PLG.Vendors[1][id])	
			PLG:setWaypoint(name, location, x, y)
		end)
	end
	_G["PLG_Vendor_Button"]:Show()
end

---------------------------
-- turn off vendor button
---------------------------
function PLG:resetTooltip()
	PLG:Debug("Function","resetTooltip")
	_G["PLG_Vendor_Button"]:SetNormalTexture(nil)
	_G["PLG_Vendor_Button"]:SetScript("OnEnter",function() end)
	_G["PLG_Vendor_Button"]:SetScript("OnLeave",function() end)
	_G["PLG_Vendor_Button"]:SetScript("OnClick",function() end)
	_G["PLG_Vendor_Button"]:Hide()
end