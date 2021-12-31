hs.hotkey.bind({'ctrl'}, 'g', function()
    local kitty = hs.application.get('kitty')
    if kitty == nil then
        hs.application.launchOrFocus('/Applications/kitty.app')
    elseif kitty:isFrontmost() then
        kitty:hide()
    else
        hs.application.launchOrFocus('/Applications/kitty.app')
    end
end)

hs.hotkey.bind({'ctrl', 'shift'}, 'b', function()
    local brave = hs.application.get('Brave Browser')
    if brave == nil then
        hs.application.launchOrFocus('/Applications/Brave Browser.app')
    elseif brave:isFrontmost() then
        brave:hide()
    else
        hs.application.launchOrFocus('/Applications/Brave Browser.app')
    end
end)
