hs.hotkey.bind({ "ctrl" }, "g", function()
	local wezterm = hs.application.get("WezTerm")
	if wezterm == nil then
		hs.application.launchOrFocus("/Applications/WezTerm.app")
	elseif wezterm:isFrontmost() then
		wezterm:hide()
	else
		hs.application.launchOrFocus("/Applications/WezTerm.app")
	end
end)
