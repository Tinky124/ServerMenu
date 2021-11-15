ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local attempts = {}

RegisterNetEvent("posalji:bugreport")
AddEventHandler("posalji:bugreport", function(data)
    local src = source
    local igrac = ESX.GetPlayerFromId(src)
    local DiscordID = "Nepoznat" 
	for i = 0, GetNumPlayerIdentifiers(src) - 1 do
	    local id = GetPlayerIdentifier(src, i)	
		if string.find(id, "discord") then
			DiscordID ="<@" ..id:gsub("discord:", "")..">"
		end
	end    
    if DiscordID == 'Nepoznat' then
       return igrac.showNotification('You do not have an authorized discord')
    end
    if attempts[src] == nil then
        attempts[src] = 0 
    end
    if attempts[src] > 5 then
        DropPlayer(src, 'Trying to crash server with POST Request')
    end
    attempts[src] = attempts[src] + 1
    local embeds = {{
        ["color"] = 2061822,
        ["title"]= "Send by: " .. DiscordID,
        ["description"] = "Data of bug: "..data.why,
        ["footer"] = {
            ["text"] = "🔰 Bug Report 🔰",
        },}}
    PerformHttpRequest(Config.BugReport, function(err, text, headers) end, 'POST', json.encode({ username = "Bug Report", embeds = embeds}), { ['Content-Type'] = 'application/json' })
    BackAttempts()
end)

RegisterNetEvent("posalji:prijedlog")
AddEventHandler("posalji:prijedlog", function(data)
    local src = source
    local igrac = ESX.GetPlayerFromId(src)
    local DiscordID = "Nepoznat" 
	for i = 0, GetNumPlayerIdentifiers(src) - 1 do
	    local id = GetPlayerIdentifier(src, i)	
		if string.find(id, "discord") then
			DiscordID ="<@" ..id:gsub("discord:", "")..">"
		end
	end    
    if DiscordID == 'Nepoznat' then
       return igrac.showNotification('You do not have an authorized discord')
    end
    if attempts[src] == nil then
        attempts[src] = 0 
    end
    if attempts[src] > 5 then
        DropPlayer(src, 'Trying to crash server with POST Request')
    end
    attempts[src] = attempts[src] + 1
    local embeds = {{
        ["color"] = 2061822,
        ["title"]= "Send by: " ..DiscordID,
        ["description"] = "Suggestion: "..data.prijedlogtext,
        ["footer"] = {
            ["text"] = "🔰 Suggest 🔰",
        },}}
    PerformHttpRequest(Config.Suggest, function(err, text, headers) end, 'POST', json.encode({ username = "Suggest", embeds = embeds}), { ['Content-Type'] = 'application/json' })
    BackAttempts()
end)

RegisterNetEvent("posalji:reportplayer")
AddEventHandler("posalji:reportplayer", function(data)
    local src = source
    local igrac = ESX.GetPlayerFromId(src)
    local DiscordID = "Nepoznat" 
	for i = 0, GetNumPlayerIdentifiers(src) - 1 do
	    local id = GetPlayerIdentifier(src, i)	
		if string.find(id, "discord") then
			DiscordID ="<@" ..id:gsub("discord:", "")..">"
		end
	end    
    if DiscordID == 'Nepoznat' then
       return igrac.showNotification('You do not have an authorized discord')
    end
    if attempts[src] == nil then
        attempts[src] = 0 
    end
    if attempts[src] > 5 then
        DropPlayer(src, 'Trying to crash server with POST Request')
    end
    attempts[src] = attempts[src] + 1
   local embeds = {{
    ["color"] = 2061822,
    ["title"]= "Send by: " ..data.discordimeprijedloga,
    ["description"] = "Logged-on name: "..data.discordimeprijaveigracatarget.. ", for " .. data.prijavatext,
    ["footer"] = {
        ["text"] = "🔰 Reporting Player 🔰",
    },}}
    PerformHttpRequest(Config.ReportPlayer, function(err, text, headers) end, 'POST', json.encode({ username = "Reports", embeds = embeds}), { ['Content-Type'] = 'application/json' })
    BackAttempts()
end)

function Change()
  attempts = {}
end

function BackAttempts()
  SetTimeout(10000, Change)
end
