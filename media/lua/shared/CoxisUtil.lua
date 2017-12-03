--[[
#########################################################################################################
#	@mod:		CoxisUtil - Basci utilities for Coxis mods                                              #
#	@author: 	Dr_Cox1911					                                                            #
#	@notes:		Many thanks to RJ�s LastStand code and all the other modders out there					#
#	@notes:													                                  			#
#	@link: 													       										#
#########################################################################################################
--]]

CoxisUtil = {};

CoxisUtil.readINI = function(_modID, _filename)
	local settingsFile = getModFileReader(_modID, _filename, true);
	local inidata = {};
	-- we fetch our file to bind our keys (load the file)
	local line = nil;
	local section = "empty";
	-- we read each line of our file
	while true do
		line = settingsFile:readLine();
		if line == nil then
			settingsFile:close();
			break;
		end

		if (luautils.stringStarts(line, "[")) then
			section = string.sub(line, 2, -2);
			inidata[section] = {};
			--print("found a section: " .. section);
		end
		if (not luautils.stringStarts(line, "[") and not luautils.stringStarts(line, ";") and line ~= "") then
			local splitedLine = string.split(line, "=")
			local key = splitedLine[1]
			local value = splitedLine[2]--tonumber(splitedLine[2])
			--print("found a key: " .. tostring(key) .. " value: " .. tostring(value));
			-- ignore obsolete bindings, override the default key
			inidata[section][key] = value;
		end
	end

	-- DEBUG, uncomment here to see the loaded ini data
	-- for k,v in pairs(CoxisShopServer.settings) do
			-- print("Section " .. tostring(k));
			-- for key, value in pairs(v) do
				-- print("Key: " .. tostring(key) .. " value " .. tostring(value));
			-- end
	-- end
	return inidata;
end

CoxisUtil.readTXT = function(_modID, _filename)
	local settingsFile = getModFileReader(_modID, _filename, true);
	local line = nil;
	local txt = "";
		while true do
		line = settingsFile:readLine();
		if line == nil then
			settingsFile:close();
			break;
		end
		txt = txt .. tostring(line);
	end
	return txt;
end

CoxisUtil.printDebug = function(_module, _string)
	if _module ~= nil and _string ~= nil then
		print("..." .. tostring(_module) .. "..." .. tostring(_string));
	elseif _module == nil and _string ~= nil then
		print("...NO MODULE RECEIVED..." .. tostring(_string));
	else
		print("...ERROR IN DEBUG...");
	end
end


---
-- Shows a modal window that informs the player about something and only has
-- an okay button to be closed.
--
-- @param _text - The text to display on the modal
-- @param _centered - If set to true the modal will be centered (optional)
-- @param _width - The width of the window (optional)
-- @param _height - The height of the window (optional)
-- @param _func - The function that should be called when the button is clicked
--
-- @author RoboMat (I only added the function param)
--
CoxisUtil.okModal = function(_text, _centered, _width, _height, _posX, _posY, _func)
    local posX = _posX or 0;
    local posY = _posY or 0;
    local width = _width or 230;
    local height = _height or 120;
    local centered = _centered;
    local txt = _text;
	local func = _func or nil;
    local core = getCore();

    -- center the modal if necessary
    if centered then
        posX = core:getScreenWidth() * 0.5 - width * 0.5;
        posY = core:getScreenHeight() * 0.5 - height * 0.5;
    end

    local modal = ISModalDialog:new(posX, posY, width, height, txt, false, nil, func);
    modal:initialise();
    modal:addToUIManager();
end
