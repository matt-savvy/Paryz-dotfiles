vim.cmd.source("~/dotfiles/vimrc")

vim.opt.hidden = true           -- Allow buffers to become hidden
vim.opt.encoding = "utf-8"      -- Use UTF-8 encoding
vim.opt.incsearch = true        -- Move while searching

------------- Color Schemes ----------------
vim.opt.termguicolors = true
vim.cmd.colorscheme("heraldish")
