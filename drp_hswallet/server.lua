RegisterServerEvent("GetMoney")
AddEventHandler("GetMoney",function()
    local src = source
    local CharacterData = exports["drp_id"]:GetCharacterData(src)

    TriggerEvent("DRP_Bank:GetCharacterMoney", CharacterData.charid, function(characterMoney)
        TriggerClientEvent('sendData', src, CharacterData.name, CharacterData.charid, characterMoney.data[1].cash, characterMoney.data[1].dirtyCash)
    end)
end)