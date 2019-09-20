--------------------------------------------------------------------
-- PLG Common Functions
--------------------------------------------------------------------

---------------------------
-- set frame text
---------------------------
function PLG:setText(fs,text,s1,s2)
	if (s1) or (s2) then
		_G["PLG_"..fs]:SetFormattedText(tostring(text),s1,s2)
	else
		_G["PLG_"..fs]:SetText(tostring(text))
	end
end

---------------------------
-- send/set messages
---------------------------
function PLG:sendMSG(text)
	print(PLG.colors.BLUE..PLG.labels.NAME..":|r "..tostring(text))
end

---------------------------
-- debugging messages
---------------------------
function PLG:Debug(text,val)
	if PLG.verbose then
		print(PLG.colors.BLUE..PLG.labels.NAME..":|r "..tostring(text)..": "..tostring(val))
	end
end

---------------------------
-- tooltip text
---------------------------
function PLG:Tooltip(text1,text2,color1,color2,wrap)
	local RGB = PLG.colors.RGB
	if text1 and not color1 then -- title
		PLG.tooltip:SetText(text1, RGB["GLD"])
	elseif text1 and not text2 then -- line/wrap
		wrap = wrap or 0
		local r,g,b = unpack(RGB[color1])
		PLG.tooltip:AddLine(text1, r, g, b, wrap)
	elseif text2 and color2 then -- double
		local r,g,b = unpack(RGB[color1])
		local r2,g2,b2 = unpack(RGB[color2])
		PLG.tooltip:AddDoubleLine(text1, text2, r, g, b, r2, g2, b2)
	elseif not text1 then -- space
		PLG.tooltip:AddLine(" ", RGB["GLD"])
	end
end

---------------------------
-- create text
---------------------------
function PLG:createText(anchor,name,x,y,w,text,font,color,center,shadow)
	local fs = anchor:CreateFontString(name, "ARTWORK", font)
	if center then
		fs:SetPoint("CENTER", anchor, "TOP", x, y)
	else
		fs:SetPoint("TOPLEFT", x, y)
	end
	fs:SetNonSpaceWrap(true)
	fs:SetWordWrap(true)
	fs:SetJustifyH("LEFT")
	fs:SetJustifyV("TOP")
	if color then
		local r,g,b = unpack(color)
		fs:SetTextColor(r,g,b,1)
	end
	fs:SetText(text)
	fs:SetHeight(40)
	if not shadow then
		fs:SetShadowColor(0, 0, 0, 0)
		fs:SetShadowOffset(0, 0)
	else
		--fs:SetShadowColor(0, 0, 0, .6)
		--fs:SetShadowOffset(1, -1)
	end
	if not w then w = fs:GetStringWidth()+10; end
	fs:SetWidth(w)
	return fs
end

---------------------------
-- create the icons
---------------------------
function PLG:createIcon(name,x,y)
	-- outline frame
	PLG[name.."Frame"] = CreateFrame("FRAME", "PLG_"..name.."_Frame", PLG.frame)
	PLG[name.."Frame"]:SetPoint("TOPLEFT", PLG.frame, "TOPLEFT", x, y)	
	PLG[name.."Frame"]:SetWidth(160)
	PLG[name.."Frame"]:SetHeight(39)
	
	-- outline background
	PLG[name.."Frame"].texture = PLG[name.."Frame"]:CreateTexture(nil, "BACKGROUND")
	PLG[name.."Frame"].texture:SetTexture(0, 0, 0, .2)
	PLG[name.."Frame"].texture:SetAllPoints(PLG[name.."Frame"])
	
	-- outline backdrop
	PLG[name.."Frame"]:SetBackdrop({bgFile = nil, edgeFile = PLG.textures.BACKDROP, tile = true, tileSize = 4, edgeSize = 4, insets = { left = 1, right = 1, top = 1, bottom = 1 }});
	PLG[name.."Frame"]:SetBackdropBorderColor(0,0,0,.7)
	
	-- the icon
	PLG[name.."Icon"] = CreateFrame("BUTTON", "PLG_"..name.."_Icon", PLG[name.."Frame"])
	PLG[name.."Icon"]:SetPoint("TOPLEFT", PLG[name.."Frame"], "TOPLEFT", 0, 0)	
	PLG[name.."Icon"]:SetWidth(39)
	PLG[name.."Icon"]:SetHeight(39)
	
	-- the texture (as .texture so SetVertexColor works)
	PLG[name.."Icon"].texture = PLG[name.."Icon"]:CreateTexture(nil, "BACKGROUND")
	PLG[name.."Icon"].texture:SetTexture(0, 0, 0, 0)
	PLG[name.."Icon"].texture:SetAllPoints(PLG[name.."Icon"])
	
	-- the text
	if name ~= "Recipe1" and name ~= "Recipe2" then
		PLG:createText(PLG[name.."Icon"],"PLG_"..name.."_Text",42,-2,118,"","GameFontNormalSmall2", PLG.colors.RGB.WHT, false, true)
	else
		PLG:createText(PLG[name.."Icon"],"PLG_"..name.."_Text",42,-2,118,"","GameFontNormalSmall2", PLG.colors.RGB.YEL, false, true)
	end
	
	-- reagents only
	if name ~= "Recipe1" and name ~= "Recipe2" then
		-- the count frame, to see better
		PLG[name.."CountFrame"] = CreateFrame("FRAME", "PLG_"..name.."_CountFrame", PLG[name.."Icon"])
		PLG[name.."CountFrame"]:SetPoint("BOTTOMLEFT", PLG[name.."Icon"], "BOTTOMLEFT", 2, 1)	
		PLG[name.."CountFrame"]:SetWidth(35)
		PLG[name.."CountFrame"]:SetHeight(12)
		
		-- count background
		PLG[name.."CountFrame"].texture = PLG[name.."CountFrame"]:CreateTexture(nil, "BACKGROUND")
		PLG[name.."CountFrame"].texture:SetTexture(0, 0, 0, .7)
		PLG[name.."CountFrame"].texture:SetAllPoints(PLG[name.."CountFrame"])
	
		-- the item count text
		PLG:createText(PLG[name.."CountFrame"],"PLG_"..name.."_Count",-5,0,40,"","ReputationDetailFont", nil, false, true)	
		_G["PLG_"..name.."_Count"]:SetJustifyH("RIGHT")
	-- recipes only
	else	
		-- difficulty frame
		PLG[name.."Color"] = CreateFrame("FRAME", "PLG_"..name.."_Color", PLG[name.."Frame"])
		PLG[name.."Color"]:SetPoint("BOTTOMRIGHT", PLG[name.."Frame"], "BOTTOMRIGHT", 0, 0)	
		PLG[name.."Color"]:SetWidth(121)
		PLG[name.."Color"]:SetHeight(5)
		
		-- difficulty background
		PLG[name.."Color"].texture = PLG[name.."Color"]:CreateTexture(nil, "BACKGROUND")
		PLG[name.."Color"].texture:SetTexture(PLG.SkillType["optimal"].r, PLG.SkillType["optimal"].g, PLG.SkillType["optimal"].b, 1)
		PLG[name.."Color"].texture:SetAllPoints(PLG[name.."Color"])
		
		-- difficulty backdrop
		PLG[name.."Color"]:SetBackdrop({bgFile = nil, edgeFile = PLG.textures.BACKDROP, tile = true, tileSize=4, edgeSize=4, insets={ left=1, right=1, top=1, bottom=1 }});
		PLG[name.."Color"]:SetBackdropBorderColor(0,0,0,.7)
	end
end

---------------------------
-- ? = T : F
---------------------------
function PLG:getCondition(condition, t, f)
	if condition then return t else return f end
end