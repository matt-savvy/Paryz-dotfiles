vim.cmd.source("~/dotfiles/vimrc")

vim.opt.hidden = true           -- Allow buffers to become hidden (default)
vim.opt.encoding = "utf-8"      -- Use UTF-8 encoding (default)
vim.opt.incsearch = true        -- Move while searching (default)
vim.opt.laststatus = 2          -- Always show the status line (default)


------------- Color Schemes ----------------
vim.opt.termguicolors = true
vim.cmd.colorscheme("heraldish")
