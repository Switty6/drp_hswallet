
RegisterServerEvent("GetMoney")
AddEventHandler("GetMoney",function()
    local src = source
    local name = exports['drp_id']:GetCharacterName(source)
    local CharacterData = exports["drp_id"]:GetCharacterData(source)


    TriggerEvent("DRP_Bank:GetCharacterMoney", CharacterData.charid, function(characterMoney)

    if characterMoney.data[1].dirtycash == nil then
        characterMoney.data[1].dirtycash = 0
    end

    TriggerClientEvent('sendData', src, name, CharacterData.charid, characterMoney.data[1].cash, characterMoney.data[1].dirtycash)

    end)
end)



