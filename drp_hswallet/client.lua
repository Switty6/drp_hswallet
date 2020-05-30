local status = false

RegisterCommand("wallet", function()
    status = not status
    local spawnedIn = false
    local head = RegisterPedheadshot(PlayerPedId())
            
    while not IsPedheadshotReady(head) or not IsPedheadshotValid(head) do
        Wait(1)
    end
            
    SendNUIMessage({
        type = 'key',
        status = status,
        headshot = headshot,
        resourceName = GetCurrentResourceName()
    })

    Wait(460)
    headshot = GetPedheadshotTxdString(head)

        
    while status do
        Wait(1)
        DrawSprite(headshot, headshot, 0.7345, 0.83, 0.05, 0.08, 0.0, 255, 255, 255, 255)
    end
end)

RegisterNUICallback("check", function(data)
    TriggerServerEvent('GetMoney')
end)

RegisterNetEvent('sendData')
AddEventHandler('sendData', function(name, id, cash, dirty)
    local cash = cash + 0.0
    if dirty == nil then
        dirty = 0.0
    else 
        local dirty = dirty + 0.0
    end

    SendNUIMessage({
        type = 'walletdata',
        name = name,
        id = id,
        cash = format_thousand(cash),
        dirty = format_thousand(dirty)
    })
end)

function format_thousand(v)
    local s = string.format("%d", math.floor(v))
    local pos = string.len(s) % 3
    if pos == 0 then pos = 3 end
    return string.sub(s, 1, pos)
        .. string.gsub(string.sub(s, pos + 1), "(...)", ".%1")
end
