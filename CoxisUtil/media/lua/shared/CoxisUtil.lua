--[[
#########################################################################################################
#	@mod:		CoxisUtil - Basci utilities for Coxis mods                                              #
#	@author: 	Dr_Cox1911					                                                            #
#	@notes:		Many thanks to RJ´s LastStand code and all the other modders out there					#
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