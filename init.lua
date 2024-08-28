vim.cmd.source("~/dotfiles/vimrc")

vim.opt.hidden = true           -- Allow buffers to become hidden (default)
vim.opt.encoding = "utf-8"      -- Use UTF-8 encoding (default)
vim.opt.incsearch = true        -- Move while searching (default)
vim.opt.laststatus = 2          -- Always show the status line (default)
vim.opt.report = 2              -- Tell us when anything is changed via :...
vim.opt.scrolloff = 10          -- Keep 10 lines (top/bottom) for scope
vim.opt.showcmd = true          -- Show the command being typed (default)
vim.opt.showmatch = true        -- Show matching brackets
vim.opt.backspace = "indent,eol,start" -- (default)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.virtualedit = "block"   -- Allow the cursor to go anywhere in visual block mode

------------- Color Schemes ----------------
vim.opt.termguicolors = true
vim.cmd.colorscheme("heraldish")
