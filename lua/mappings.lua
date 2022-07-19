-- more mappings are defined in `lua/config/which.lua`
local map = vim.keymap.set
local default_options = { silent = true }
local expr_options = { expr = true, silent = true }

--Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

--Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- paste over currently selected text without yanking it
map("v", "p", '"_dP', default_options)

-- Tab switch buffer
map("n", "<TAB>", ":BufferLineCycleNext<CR>", default_options)
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", default_options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", default_options)
map("n", "<Right>", ":vertical resize -1<CR>", default_options)
map("n", "<Up>", ":resize -1<CR>", default_options)
map("n", "<Down>", ":resize +1<CR>", default_options)

-- Autocorrect spelling from previous error
map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", default_options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

-- LSP Mappings
map("n", "gD", function()
	vim.lsp.buf.declaration()
end)

map("n", "gd", function()
	vim.lsp.buf.definition()
end)

map("n", "K", function()
	vim.lsp.buf.hover()
end)

map("n", "gi", function()
	vim.lsp.buf.implementation()
end)

map("n", "<C-k>", function()
	vim.lsp.buf.signature_help()
end)

map("n", "<leader>D", function()
	vim.lsp.buf.type_definition()
end)

map("n", "mm", function()
	vim.lsp.buf.rename()
end)

map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end)

map("n", "gr", function()
	vim.lsp.buf.references()
end)

map("n", "[d", function()
	vim.diagnostic.goto_prev()
end)

map("n", "d]", function()
	vim.diagnostic.goto_next()
end)

map("n", "<leader>q", function()
	vim.diagnostic.setloclist()
end)

map("n", "<leader>fm", function()
	vim.lsp.buf.formatting()
end)

map("n", "<leader>wa", function()
	vim.lsp.buf.add_workspace_folder()
end)

map("n", "<leader>wr", function()
	vim.lsp.buf.remove_workspace_folder()
end)

map("n", "<leader>fw", "<cmd> :Telescope live_grep <CR>")
-- starlite mappings
map("n", "*", function()
	return require("starlite").star()
end, default_options)
map("n", "g*", function()
	return require("starlite").g_star()
end, default_options)
map("n", "#", function()
	return require("starlite").hash()
end, default_options)
map("n", "g#", function()
	return require("starlite").g_hash()
end, default_options)

-- move over a closing element in insert mode
map("i", "<C-l>", function()
	return require("functions").escapePair()
end, default_options)

-- Nvim tree
map("n", "<leader>-", "<cmd> :NvimTreeToggle <CR>")
