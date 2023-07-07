hs.hotkey.bind({ "ctrl" }, "g", function()
	local wezterm = hs.application.get("Rio")
	if wezterm == nil then
		hs.application.launchOrFocus("/Applications/Rio.app")
	elseif wezterm:isFrontmost() then
		wezterm:hide()
	else
		hs.application.launchOrFocus("/Applications/Rio.app")
	end
end)
