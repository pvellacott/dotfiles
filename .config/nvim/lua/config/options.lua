
-- Basic editor settings
vim.opt.number = true                  -- nu
vim.opt.relativenumber = true          -- relativenumber
vim.opt.wrap = false                    -- nowrap
vim.opt.tabstop = 4                     -- tabstop
vim.opt.softtabstop = 4                 -- softtabstop
vim.opt.shiftwidth = 4                  -- shiftwidth
vim.opt.expandtab = true                -- expandtab
vim.opt.smartindent = true              -- smartindent
vim.opt.smartcase = true                -- smartcase
vim.opt.incsearch = true                -- incsearch
vim.opt.mouse = "a"                     -- mouse support
vim.opt.clipboard = "unnamed"           -- system clipboard
vim.opt.swapfile = false                -- noswapfile
vim.opt.backup = false                  -- nobackup
vim.opt.errorbells = false		-- disable error bells

-- Undo files
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Spelling
vim.opt.spelllang = "en"
-- spell only for the current buffer
vim.cmd("autocmd BufReadPost,BufNewFile * setlocal spell")

