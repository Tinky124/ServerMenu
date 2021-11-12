ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand(Config.Command, function()
    SendNUIMessage({type = 'otvorimenu'})
SetNuiFocus(true, true)
end)

RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("bugreport", function(data)
data = data
TriggerServerEvent("posalji:bugreport", data)
end)

RegisterNUICallback("prijedlog", function(data)
    data = data
    TriggerServerEvent("posalji:prijedlog", data)
end)

RegisterNUICallback("reportplayer", function(data)
    data = data
    TriggerServerEvent("posalji:reportplayer", data)
end)