RegisterNetEvent("posalji:bugreport")
AddEventHandler("posalji:bugreport", function(data)
    local embeds = {{
        ["color"] = 2061822,
        ["title"]= "Send by: " ..data.discordime,
        ["description"] = "Data of bug: "..data.why,
        ["footer"] = {
            ["text"] = "🔰 Bug Report 🔰",
        },}}
PerformHttpRequest(Config.BugReport, function(err, text, headers) end, 'POST', json.encode({ username = "Bug Report", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent("posalji:prijedlog")
AddEventHandler("posalji:prijedlog", function(data)
    local embeds = {{
        ["color"] = 2061822,
        ["title"]= "Send by: " ..data.discordimeprijedloga,
        ["description"] = "Suggestion: "..data.prijedlogtext,
        ["footer"] = {
            ["text"] = "🔰 Suggest 🔰",
        },}}
PerformHttpRequest(Config.Suggest, function(err, text, headers) end, 'POST', json.encode({ username = "Suggest", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent("posalji:reportplayer")
AddEventHandler("posalji:reportplayer", function(data)
   local embeds = {{
    ["color"] = 2061822,
    ["title"]= "Send by: " ..data.discordimeprijedloga,
    ["description"] = "Logged-on name: "..data.discordimeprijaveigracatarget.. ", for " .. data.prijavatext,
    ["footer"] = {
        ["text"] = "🔰 Reporting Player 🔰",
    },}}
PerformHttpRequest(Config.ReportPlayer, function(err, text, headers) end, 'POST', json.encode({ username = "Reports", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end)