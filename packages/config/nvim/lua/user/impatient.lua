local packer_compiled_status_ok, _ = pcall(require, "packer_compoiled")
if not packer_compiled_status_ok then
	return
end

local impatient_status_ok, _ = pcall(require, "impatient")
if not impatient_status_ok then
	return
end
