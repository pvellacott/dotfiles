
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>e", ":Neotree toggle<CR>", opts)		-- Toggle Neo-tree
map("n", "<leader>f", ":Telescope find_files<CR>", opts)	-- Telescope find files
map("n", "<leader>g", ":Telescope live_grep<CR>", opts)		-- Live grep
