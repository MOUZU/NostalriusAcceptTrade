local lastChange = 0
local f = CreateFrame("Frame")
f:SetScript('OnEvent', function()
        if event == "TRADE_MONEY_CHANGED" or event == "TRADE_PLAYER_ITEM_CHANGED" then
            lastChange = GetTime()
        elseif event == "TRADE_SHOW" then
            f:SetScript('OnUpdate', function()
                    if (lastChange + 2) < GetTime() then
                        TradeFrameTradeButton:Enable()
                    else
                        TradeFrameTradeButton:Disable()
                    end
                end)
        elseif event == "TRADE_HIDE" then
            f:SetScript('OnUpdate', nil)
        end
    end)
f:RegisterEvent("TRADE_MONEY_CHANGED")
f:RegisterEvent("TRADE_PLAYER_ITEM_CHANGED")
f:RegisterEvent("TRADE_SHOW")
f:RegisterEvent("TRADE_HIDE")