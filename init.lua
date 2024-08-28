vim.cmd.source("~/dotfiles/vimrc")

vim.opt.hidden = true           -- Allow buffers to become hidden
vim.opt.encoding = "utf-8"      -- Use UTF-8 encoding
vim.opt.incsearch = true        -- Move while searching
vim.opt.laststatus = 2          -- Always show the status line

------------- Color Schemes ----------------
vim.opt.termguicolors = true
vim.cmd.colorscheme("heraldish")
