hs.hotkey.bind({'ctrl'}, '<F12>', function()
    local kitty = hs.application.get('kitty')
    if kitty == nil then
        hs.application.launchOrFocus('/Applications/kitty.app')
    elseif kitty:isFrontmost() then
        kitty:hide()
    else
        hs.application.launchOrFocus('/Applications/kitty.app')
    end
end)