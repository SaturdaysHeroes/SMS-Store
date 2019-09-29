SMS = SMS || {}
SMS.Config = SMS.Config || {}

-- Which commands should open the panel?
SMS.Config.Commands = {
    ["!sms"] = true,
    ["/sms"] = true
}

-- What number does your SimPay instance use?
SMS.Config.PNumber = 7055

-- What packages does your SimPay instance have?
SMS.Config.Packages = {
    [1] = {
        strName = "VIP",
        intID = 0001,
        intPrice = 30,
        onSuccess = function(pPlayer)
            pPlayer:ChatPrint("VIP!")
        end,
        onFailure = function(pPlayer)
            print("fail")
        end
    },

    [2] = {
        strName = "VIP+",
        intID = 0002,
        intPrice = 80,
        onSuccess = function(pPlayer)
            pPlayer:ChatPrint("VIP+!")
        end,
        onFailure = function(pPlayer)
            print("fail")
        end
    },

    [3] = {
        strName = "100 Credits",
        intID = 0004,
        intPrice = 15,
        onSuccess = function(pPlayer)
            pPlayer:ChatPrint("100 Credits!")
        end,
        onFailure = function(pPlayer)
            print("fail")
        end
    },

    [4] = {
        strName = "500 Credits",
        intID = 0005,
        intPrice = 60,
        onSuccess = function(pPlayer)
            pPlayer:ChatPrint("500 Credits!")
        end,
        onFailure = function(pPlayer)
            print("fail")
        end
    }
}

-- Which strings should the script use?
SMS.Config.Language = {
    onpurchase = "Thank you for using our SMS Store!"
    onfailure = "Transaction failed, please try again later!"
}
