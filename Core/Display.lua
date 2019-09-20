--------------------------------------------------------------------
-- PLG Display Functions
--------------------------------------------------------------------

---------------------------
-- set, reset recipe
---------------------------
function PLG:setRecipe(id,name,color,icon,link)
	PLG:Debug("Function","setRecipe"..id..": "..tostring(link))
	
	-- if color set difficulty or hide
	if color then
		PLG["Recipe"..id.."Color"].texture:SetTexture(color.r, color.g, color.b, 1)
	end
	
	-- if name set recipe title and text or hide
	if name then -- set name
		if id==1 then -- set recipe title
			PLG:setText("Recipe"..id.."_Title",PLG.labels.RECIPE)
		else -- set alternate title
			PLG:setText("Recipe"..id.."_Title",PLG.labels.ALTERNATE)
		end
		PLG:setText("Recipe"..id.."_Text",name)
	else
		PLG:setText("Recipe"..id.."_Title","")
		PLG:setText("Recipe"..id.."_Text","")
	end
	
	-- if icon...
	if icon then 
		-- set icon
		PLG["Recipe"..id.."Icon"].texture:SetTexture(icon)
		
		-- shade when not selected
		if id ~= PLG.selectedRecipe then 
			PLG["Recipe"..id.."Icon"].texture:SetVertexColor(0.5, 0.5, 0.5)
			PLG["Recipe"..id.."Frame"].texture:SetTexture(0, 0, 0, .4)			
			local r,g,b = unpack(PLG.colors.RGB.GRY)
			_G["PLG_Recipe"..id.."_Text"]:SetTextColor(r,g,b,1)
		else
			PLG["Recipe"..id.."Icon"].texture:SetVertexColor(1, 1, 1)
			PLG["Recipe"..id.."Frame"].texture:SetTexture(0, 0, 0, .2)	
			local r,g,b = unpack(PLG.colors.RGB.YEL)
			_G["PLG_Recipe"..id.."_Text"]:SetTextColor(r,g,b,1)
		end
		
		-- set tooltips
		if link then -- set link
			PLG["Recipe"..id.."Icon"]:SetScript("OnEnter",function() PLG:setDataTooltip("Recipe",id,link,true) end)
			PLG["Recipe"..id.."Icon"]:SetScript("OnLeave",function() PLG:setDataTooltip("Recipe",id,link,false) end)	
			PLG["Recipe"..id.."Frame"]:SetScript("OnEnter",function() PLG:setDataTooltip("Recipe",id,link,true) end)
			PLG["Recipe"..id.."Frame"]:SetScript("OnLeave",function() PLG:setDataTooltip("Recipe",id,link,false) end)	
		else -- no link
			PLG["Recipe"..id.."Icon"]:SetScript("OnEnter",function() end)
			PLG["Recipe"..id.."Frame"]:SetScript("OnEnter",function() end)
		end
		-- two recipes, add onclick to non-selected
		if (PLG["Recipe1Icon"].texture:GetTexture() and PLG["Recipe2Icon"].texture:GetTexture())then 
			PLG["Recipe1Icon"]:SetScript("OnClick",function() PLG.selectedRecipe = 1; PLG:TRADE_SKILL_UPDATE(1); end)
			PLG["Recipe1Frame"]:SetScript("OnMouseDown",function() PLG.selectedRecipe = 1; PLG:TRADE_SKILL_UPDATE(1); end)
			PLG["Recipe2Icon"]:SetScript("OnClick",function() PLG.selectedRecipe = 2; PLG:TRADE_SKILL_UPDATE(2); end)
			PLG["Recipe2Frame"]:SetScript("OnMouseDown",function() PLG.selectedRecipe = 2; PLG:TRADE_SKILL_UPDATE(2); end)
		end
		
		-- show the frame
		PLG["Recipe"..id.."Frame"]:Show()
		
	-- no icon, no scripts, hide the frame	
	else 
		PLG["Recipe"..id.."Icon"].texture:SetTexture(nil)
		PLG["Recipe"..id.."Icon"]:SetScript("OnEnter",function() end)
		PLG["Recipe"..id.."Frame"]:SetScript("OnEnter",function() end)
		PLG["Recipe"..id.."Frame"]:Hide()
	end
end

---------------------------
-- set, reset reagent
---------------------------
function PLG:setReagent(id,text,count,icon,link)
	PLG:Debug("Function","setReagent"..id..": "..tostring(link))
	
	-- set text or hide
	if text then 
		PLG:setText("Reagent"..id.."_Text",text)
	else
		PLG:setText("Reagent"..id.."_Text","")
	end
	
	-- set count or hide
	if count then
		PLG:setText("Reagent"..id.."_Count",count)
	else -- no count
		PLG:setText("Reagent"..id.."_Count","")
	end
	
	-- set the icon or hide
	if icon then 
		PLG["Reagent"..id.."Icon"]:SetNormalTexture(icon)
		-- set the tooltips
		if link then
			PLG["Reagent"..id.."Icon"]:SetScript("OnEnter",function() PLG:setDataTooltip("Reagent",id,link,true) end)
			PLG["Reagent"..id.."Icon"]:SetScript("OnLeave",function() PLG:setDataTooltip("Reagent",id,link,false) end)
			PLG["Reagent"..id.."Frame"]:SetScript("OnEnter",function() PLG:setDataTooltip("Reagent",id,link,true) end)
			PLG["Reagent"..id.."Frame"]:SetScript("OnLeave",function() PLG:setDataTooltip("Reagent",id,link,false) end)
		-- no tooltip, kill onenter	
		else 
			PLG["Reagent"..id.."Icon"]:SetScript("OnEnter",function() end)
			PLG["Reagent"..id.."Frame"]:SetScript("OnEnter",function() end)
		end
		-- set title, show frame
		PLG:setText("Reagent_Title",PLG.labels.REAGENTS)
		PLG["Reagent"..id.."Frame"]:Show()
	-- no icon, no scripts, hide frame	
	else 
		PLG:setText("Reagent_Title","")
		PLG["Reagent"..id.."Icon"]:SetNormalTexture(nil)
		PLG["Reagent"..id.."Icon"]:SetScript("OnEnter",function() end)
		PLG["Reagent"..id.."Frame"]:SetScript("OnEnter",function() end)
		PLG["Reagent"..id.."Frame"]:Hide()
	end
end

---------------------------
-- set, reset tooltip
---------------------------
function PLG:setDataTooltip(Type,id,link,on)
	if on then
		GameTooltip:SetOwner(PLG[Type..id.."Icon"], "ANCHOR_TOPLEFT");
		GameTooltip:SetHyperlink(link);		
		-- cursor and click note on alternate
		if id ~= PLG.selectedRecipe and Type == "Recipe" then 
			SetCursor("CAST_CURSOR")
			GameTooltip:AddLine(PLG.tooltips.SELECT,1,1,1,0)
		end
		GameTooltip:Show(); 
	else
		SetCursor("POINT_CURSOR")
		GameTooltip:Hide() 
	end
end

---------------------------
-- reset the text and icons
---------------------------
function PLG:resetDisplay()
	PLG:setRecipe(1,nil,nil,nil,nil)
	PLG:setRecipe(2,nil,nil,nil,nil)
	PLG:resetTooltip()
	for j=1,8 do
		if PLG.debug == true then
			--PLG:setReagent(j,"a1 a2 a3 a4 a5 a6 a7 a8 a9 b1 b2 b3 b4 b5 b6 b7 b8 b9 c1 c2 c3 c4 c5 c6 c7 c8 c9"..j,"1"..j.."/30","Interface\\ICONS\\Achievement_FeatsOfStrength_Gladiator_0"..j)
			PLG:setReagent(j,nil,nil,nil)
		else
			PLG:setReagent(j,nil,nil,nil)
		end
	end
	PLG:setText("Trainer","")
end