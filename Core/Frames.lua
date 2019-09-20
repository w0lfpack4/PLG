--------------------------------------------------------------------
-- PLG Create/ModifyFrames
--------------------------------------------------------------------

---------------------------
-- create the static labels
---------------------------
function PLG:createLabels()
	PLG:Debug("Function","createLabels")
	--anchor,name,x,y,w,text,font,color,center,shadow
	PLG:createText(PLG_backframe,"PLG_Title",9,-25,nil,PLG.labels.TITLE,"GameFontNormal",PLG.colors.RGB.YEL,true,true)
	PLG:createText(PLG_backframe,"PLG_Trainer",9,-55,nil,PLG.msgs.TRAINER,"GameFontNormal",PLG.colors.RGB.ORA,true,true)
	-- debug level tracking
	if PLG.debug == true and PLG.screenshot==false then
		PLG:createText(PLG_frame,"PLG_ProfessionTitle",107,-9,330," - "..PLG.debugProfession.." ("..PLG.debugEarned.."/"..PLG.debugTotal..")","GameFontNormal",PLG.colors.RGB.RED,false,true)
	end
	-- instructions
	PLG:createText(PLG_frame,"PLG_Instructions_Title",9,-6,330,PLG.labels.INSTRUCTIONS,"DestinyFontLarge",PLG.colors.RGB.BLK)
	PLG:createText(PLG_frame,"PLG_Instructions_Text",9,-28,330,"","GameFontNormal",PLG.colors.RGB.BRN)	
	-- recipe
	PLG:createText(PLG_frame,"PLG_Recipe1_Title",9,-61,nil,PLG.labels.RECIPE,"DestinyFontLarge",PLG.colors.RGB.BLK)
	-- alternate
	PLG:createText(PLG_frame,"PLG_Recipe2_Title",174,-61,nil,PLG.labels.ALTERNATE,"DestinyFontLarge",PLG.colors.RGB.BLK)
	-- reagents
	PLG:createText(PLG_frame,"PLG_Reagent_Title",9,-136,nil,PLG.labels.REAGENTS,"DestinyFontLarge",PLG.colors.RGB.BLK)
	-- help page
	PLG:createText(PLG_helpframe,"PLG_HELP_Title",0,-6,nil,PLG.labels.HELPTITLE,"DestinyFontLarge",PLG.colors.RGB.BLK)
	PLG:createText(PLG_helpframe,"PLG_HELP_Text",0,-12,PLG.helpframe:GetWidth(),PLG.help.TEXT.."\n\n","QuestFont",PLG.colors.RGB.BRN)	
	-- set help height based on text
	_G["PLG_HELP_Text"]:SetHeight(PLG.helpframe:GetHeight()*4) -- 4 pages
	_G["PLG_HELP_Text"]:SetHeight(_G["PLG_HELP_Text"]:GetStringHeight()+20) -- now get actual height + a line space
	
end
	
---------------------------
-- create the data frame
---------------------------
function PLG:createDataFrame()
	PLG:Debug("Function","createFrame")
	-- create PLG TradeSkillUI frame
	PLG.backframe = CreateFrame("FRAME", "PLG_backframe", PLG.TradeSkillFrame, "ButtonFrameTemplate")
	PLG.backframe:SetPoint("TOPLEFT", PLG.TradeSkillFrame, "TOPRIGHT", 30, 0)	
	PLG.backframe:SetWidth(364)
	SetPortraitToTexture(_G["PLG_backframePortrait"], PLG.textures.PORTRAIT );
	
	-- background texture
	PLG.backframe.texture = PLG.backframe:CreateTexture("PLG_backframePageBg", "BACKGROUND")
	PLG.backframe.texture:SetTexture(PLG.textures.BACKGROUND)
	PLG.backframe.texture:SetPoint("TOPLEFT",6,-62)
	PLG.backframe.texture:SetWidth(600)
		
	-- create content frame for backframe
	PLG.frame = CreateFrame("FRAME", "PLG_frame", PLG.backframe)
	PLG.frame:SetPoint("TOPLEFT", PLG.backframe, "TOPLEFT", 7, -65)	
	PLG.frame:SetWidth(347)
	PLG.frame:SetHeight(328)
	PLG.frame:Show()
		
	-- color frame title red for debugging
	if PLG.debug == true and PLG.screenshot==false then
		local t3 = PLG.backframe:CreateTexture(nil, "BACKGROUND")
		t3:SetTexture(.7, .1, .1, .5)
		t3:SetPoint("TOPLEFT",PLG.backframe,"TOPLEFT",6,-6)
		t3:SetWidth(344)
		t3:SetHeight(15)
	end
	
	-- create icons
	PLG:createIcon("Recipe1",8,-87)
	PLG:createIcon("Recipe2",173,-87)
	PLG:createIcon("Reagent1",8,-159)
	PLG:createIcon("Reagent2",173,-159)
	PLG:createIcon("Reagent3",8,-201)
	PLG:createIcon("Reagent4",173,-201)
	PLG:createIcon("Reagent5",8,-243)
	PLG:createIcon("Reagent6",173,-243)
	PLG:createIcon("Reagent7",8,-285)
	PLG:createIcon("Reagent8",173,-285)
	
	-- vendor/quest button	
	local v = CreateFrame("BUTTON", "PLG_Vendor_Button", PLG.frame)	
	v:SetPoint("TOPLEFT", PLG.frame, "TOPLEFT", 61, -58)	
	v:SetNormalTexture(PLG.textures.QUESTRECIPE)
	v:SetWidth(25)
	v:SetHeight(25)
	v:Hide()

end

---------------------------
-- create the help frame
---------------------------
function PLG:createHelpFrame()
	-- create help scrollframe
	PLG.scrollframe = CreateFrame("ScrollFrame", "PLG_scrollframe", PLG.backframe, "UIPanelScrollFrameTemplate")
	PLG.scrollframe:SetPoint("TOPLEFT", PLG.backframe, "TOPLEFT", 15, -65)	
	PLG.scrollframe:SetWidth(317)
	PLG.scrollframe:SetHeight(328)
	PLG.scrollframe:Show()
	PLG.scrollframe:Hide()
	
	-- scrollbar top texture
	local sTop = PLG.scrollframe:CreateTexture("PLG_scrollframeTop", "ARTWORK")
	sTop:SetTexture(PLG.textures.SCROLLBAR)
	sTop:SetPoint("TOPLEFT",PLG.scrollframe,"TOPRIGHT",-2,6)
	sTop:SetTexCoord(0,0.484375,0,0.4);
	sTop:SetSize(31, 106)
	
	-- scrollbar bottom texture
	local sBot = PLG.scrollframe:CreateTexture("PLG_scrollframeBottom", "ARTWORK")
	sBot:SetTexture(PLG.textures.SCROLLBAR)
	sBot:SetPoint("BOTTOMLEFT",PLG.scrollframe,"BOTTOMRIGHT",-2,-2)
	sBot:SetTexCoord(0.515625,1.0,0,0.4140625);
	sBot:SetSize(31, 106)
	
	-- scrollbar middle texture
	local sMid = PLG.scrollframe:CreateTexture("PLG_scrollframeMiddle", "ARTWORK")
	sMid:SetTexture(PLG.textures.SCROLLBAR)
	sMid:SetPoint("TOP",sTop,"BOTTOM")
	sMid:SetPoint("BOTTOM",sBot,"TOP")
	sMid:SetTexCoord(0,0.484375,.75,1.0);
	sMid:SetSize(31, 1)
	
	-- create help frame
	PLG.helpframe = CreateFrame("FRAME", "PLG_helpframe", PLG.scrollframe)
	PLG.helpframe:SetPoint("TOPLEFT", PLG.scrollframe, "TOPLEFT", 0, 0)	
	PLG.helpframe:SetWidth(PLG.scrollframe:GetWidth()-10)
	PLG.helpframe:SetHeight(PLG.frame:GetHeight())
	PLG.helpframe:Hide()	
	
	-- set the scroll child
	PLG.scrollframe:SetScrollChild(PLG.helpframe)
	
	-- create help button
	local h = CreateFrame("BUTTON", "PLG_Help_Button", PLG.backframe)	
	-- help/debug icon
	if PLG.debug == true and PLG.screenshot==false then
		h:SetPoint("TOPRIGHT", PLG.backframe, "TOPRIGHT", -28, 0)
		h:SetNormalTexture(PLG.textures.HELPDEBUGUP)
		h:SetPushedTexture(PLG.textures.HELPDEBUGDOWN)
		h:SetHeight(24)
	else
		h:SetPoint("TOPRIGHT", PLG.backframe, "TOPRIGHT", -28, 10)
		h:SetNormalTexture(PLG.textures.HELPUP)
		h:SetPushedTexture(PLG.textures.HELPDOWN)
		h:SetHeight(32)
	end
	h:SetWidth(16)
	
	-- help tooltip
	h:SetScript("OnEnter",function() 
		SetCursor("CAST_CURSOR")
		PLG.tooltip:ClearLines()
		PLG.tooltip:ClearAllPoints()
		PLG.tooltip:SetOwner(h,"ANCHOR_NONE")
		PLG.tooltip:SetPoint("BOTTOMLEFT", h, "TOPLEFT", 0, 0)	
		if PLG.debug == true and PLG.screenshot==false then
			PLG:Tooltip(PLG.tooltips.DEBUGTITLE)
			PLG:Tooltip(PLG.tooltips.DEBUGTEXT,nil,"WHT",nil,1)
		else
			PLG:Tooltip(PLG.tooltips.HELPTITLE)
			PLG:Tooltip(PLG.tooltips.HELPTEXT.." "..PLG.labels.TITLE,nil,"WHT",nil,1)
		end
		PLG.tooltip:Show()
	end)
	
	-- close help tooltip
	h:SetScript("OnLeave",function() 
		SetCursor("POINT_CURSOR")
		PLG.tooltip:Hide()
	end)
	
	-- help click show help scrollframe
	h:SetScript("OnClick",function() 
		if ( PLG.helpframe:IsShown() ) then
			PLG.frame:Show()
			PLG.helpframe:Hide()	
			PLG.scrollframe:Hide()		
			PLG.backframe.texture:SetWidth(600)
		else
			-- if debugging
			if PLG.debug == true then
				if PLG.debugEarned < PLG.maxLevel then
					PLG.debugEarned = PLG.debugEarned + 1
				end
				if PLG.debugEarned == PLG.debugTotal then
					if PLG.debugTotal ~= PLG.maxLevel then
						PLG.debugTotal = PLG.debugTotal + 75
					end
				end
				if PLG.screenshot==false then PLG:setText("ProfessionTitle"," - "..PLG.debugProfession.." ("..PLG.debugEarned.."/"..PLG.debugTotal..")") end
				PLG:TRADE_SKILL_UPDATE()
			-- show the recipe frame
			else
				PLG.frame:Hide()
				PLG.scrollframe:Show()	
				PLG.helpframe:Show()	
				PLG.backframe.texture:SetWidth(565)		
			end
		end
	end)
end

---------------------------
-- update the help text
---------------------------
function PLG:setHelpText()
	-- update for this profession
	local helpText = PLG.help.TEXT --main help file
	local pSL, _ = unpack(PLG:getProfession()) --profession ID
	if pSL then -- if exists
		local pText = PLG.help[PLG.ProfessionNames[pSL]] -- profession specific help
		if pText then -- if exists
			helpText = pText..helpText -- add it to help file
		end
	end
	_G["PLG_HELP_Text"]:SetText(helpText)
	_G["PLG_HELP_Text"]:SetHeight(PLG.helpframe:GetHeight()*4) -- 4 pages
	_G["PLG_HELP_Text"]:SetHeight(_G["PLG_HELP_Text"]:GetStringHeight()+20) -- now get actual height + a line space
end