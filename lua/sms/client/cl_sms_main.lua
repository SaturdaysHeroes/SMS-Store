net.Receive("SMS:Notify", function()
    local s = net.ReadString()

    chat.AddText(Color(255, 0, 0), "[SMS] ", Color(255, 255, 255), s)
end)