saturdays_lib = saturdays_lib or {}

function saturdays_lib:LoaderPrint( strString )
	local isServer = SERVER or false

	MsgC( ( not isServer and Color( 255, 120, 50 ) or Color( 130, 150, 210 ) ), "[Loader] => ", Color( 255, 255, 255 ), ( strString or "No string specified" ), "\n" )
end

local LoadFolder = "sms"
local tblFilesFound, tblDirectories = file.Find( LoadFolder .. "/*", "LUA" )


for _, sDirectory in pairs( tblDirectories ) do
	if sDirectory == "client" then
		local sFullDir = LoadFolder .. "/" .. sDirectory .. "/*.lua"
		if CLIENT then
			saturdays_lib:LoaderPrint( "Now loading client directory!" )
		end

		local tblClientsideFiles, Dirs = file.Find( sFullDir, "LUA" )
		for _, sFile in pairs( tblClientsideFiles ) do
			local sFileDir = LoadFolder .. "/" .. sDirectory .. "/" .. sFile

			if SERVER then
				AddCSLuaFile( sFileDir )
			else
				saturdays_lib:LoaderPrint( "(CLIENT) Loaded and included a file: " .. sFile )
				include( sFileDir )

				local fileName, _ = string.gsub( sFile, ".lua", ".txt" )
				sFileDir = LoadFolder .. "/" .. sDirectory .. "/" .. fileName
				local bExists = file.Read( sFileDir, "LUA" )

				if bExists then
					saturdays_lib:LoaderPrint( "(CLIENT) Found a manifest file! (" .. fileName .. ")" )
					local tFromJSON = util.JSONToTable( bExists )

					saturdays_lib:LoaderPrint( "(MANIFEST) Name: " .. ( tFromJSON.name or "Undefined" ) )
					saturdays_lib:LoaderPrint( "(MANIFEST) Description: " .. ( tFromJSON.description or "Undefined" ) )
					saturdays_lib:LoaderPrint( "(MANIFEST) Link: " .. ( tFromJSON.link or "Undefined" ) )
				end
			end
		end
	elseif sDirectory == "shared" then
		local sFullDir = LoadFolder .. "/" .. sDirectory .. "/*.lua"
		saturdays_lib:LoaderPrint( "Now loading shared directory!" )

		local tblClientsideFiles, Dirs = file.Find( sFullDir, "LUA" )
		for _, sFile in pairs( tblClientsideFiles ) do
			local sFileDir = LoadFolder .. "/" .. sDirectory .. "/" .. sFile
			saturdays_lib:LoaderPrint( "(SHARED) Loaded and included a file: " .. sFile )

			AddCSLuaFile( sFileDir )
			include( sFileDir )

			local fileName, _ = string.gsub( sFile, ".lua", ".txt" )
			sFileDir = LoadFolder .. "/" .. sDirectory .. "/" .. fileName
			local bExists = file.Read( sFileDir, "LUA" )

			if bExists then
				saturdays_lib:LoaderPrint( "(CLIENT) Found a manifest file! (" .. fileName .. ")" )
				local tFromJSON = util.JSONToTable( bExists )

				saturdays_lib:LoaderPrint( "(MANIFEST) Name: " .. ( tFromJSON.name or "Undefined" ) )
				saturdays_lib:LoaderPrint( "(MANIFEST) Description: " .. ( tFromJSON.description or "Undefined" ) )
				saturdays_lib:LoaderPrint( "(MANIFEST) Link: " .. ( tFromJSON.link or "Undefined" ) )
			end
		end
	elseif sDirectory == "server" and SERVER then
		local sFullDir = LoadFolder .. "/" .. sDirectory .. "/*.lua"
		saturdays_lib:LoaderPrint( "Now loading server directory!" )

		local tblClientsideFiles, Dirs = file.Find( sFullDir, "LUA" )
		for _, sFile in pairs( tblClientsideFiles ) do
			local sFileDir = LoadFolder .. "/" .. sDirectory .. "/" .. sFile
			saturdays_lib:LoaderPrint( "(SERVER) Loaded and included a file: " .. sFile )
			include( sFileDir )

			local fileName, _ = string.gsub( sFile, ".lua", ".txt" )
			sFileDir = LoadFolder .. "/" .. sDirectory .. "/" .. fileName
			local bExists = file.Read( sFileDir, "LUA" )

			if bExists then
				saturdays_lib:LoaderPrint( "(CLIENT) Found a manifest file! (" .. fileName .. ")" )
				local tFromJSON = util.JSONToTable( bExists )

				saturdays_lib:LoaderPrint( "(MANIFEST) Name: " .. ( tFromJSON.name or "Undefined" ) )
				saturdays_lib:LoaderPrint( "(MANIFEST) Description: " .. ( tFromJSON.description or "Undefined" ) )
				saturdays_lib:LoaderPrint( "(MANIFEST) Link: " .. ( tFromJSON.link or "Undefined" ) )
			end
		end
	end
end
