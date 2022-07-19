local M = {}

M.setup = function()
	require("rust-tools.inlay_hints").set_inlay_hints()
end

return M
