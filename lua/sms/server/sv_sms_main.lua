util.AddNetworkString("SMS:OpenPanel")
util.AddNetworkString("SMS:ProcessCode")
util.AddNetworkString("SMS:Notify")

-- Enter your API details here.
SMS.Config.APIKey = "3c7f4b55"
SMS.Config.APIPass = "1663121e0b37857519383b8f088efafb"
SMS.Config.APIPage = "https://simpay.pl/api/"

function SMS.ChatCommand(pPlayer, strText, bTeam)
    if SMS.Config.Commands[string.lower(strText)] == true then 
        net.Start("SMS:OpenPanel")
        net.Send(pPlayer)
    end
end
hook.Add("PlayerSay", "SMS:ChatCommand", SMS.ChatCommand)

function SMS:Notify(pPlayer, strText)
    net.Start("SMS:Notify")
        net.WriteString(strText)
    net.Send(pPlayer)
end

function SMS:Process(pPlayer, intCode, intPNumber, intServiceID)
    local data = {
        key = SMS.Config.APIKey,
        secret = SMS.Config.APIPass,
        service_id = strServiceID,
        number = intPNumber,
        code = strCode
    }

    http.Post(SMS.Config.APIPage, params = util.TableToJSON(data), function(result)
        response = util.JSONToTable(result)

        if response.respond.status == "OK" then 
            for _, v in pairs(SMS.Config.Packages) do
                if v.intID == intServiceID then 
                    v.onSuccess(pPlayer)
                    SMS:Notify(pPlayer, "[SMS] "..SMS.Config.Language.onpurchase)
                end
            end   
        else
            SMS:Notify(pPlayer, "[SMS] "..SMS.Config.Language.onfailure)
            v.onFailure(pPlayer)
        end  
    end)
end
net.Receive("SMS:ProcessCode", function(len, ply)
    local code = net.ReadInt(5)
    local pnumber = SMS.Config.PNumber
    local serviceid = net.ReadInt(4)

    SMS:Process(ply, code, pnumber, serviceid)
end)

