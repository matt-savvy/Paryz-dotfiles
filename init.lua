vim.cmd.source("~/dotfiles/vimrc")

vim.opt.hidden = true           -- Allow buffers to become hidden (default)
vim.opt.encoding = "utf-8"      -- Use UTF-8 encoding (default)
vim.opt.incsearch = true        -- Move while searching (default)
vim.opt.laststatus = 2          -- Always show the status line (default)
vim.opt.report = 2              -- Tell us when anything is changed via :...
vim.opt.scrolloff = 10          -- Keep 10 lines (top/bottom) for scope
vim.opt.showcmd = true          -- Show the command being typed (default)
vim.opt.showmatch = true        -- Show matching brackets
vim.opt.backspace = { "indent", "eol" , "start" } -- (default)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.virtualedit = "block"   -- Allow the cursor to go anywhere in visual block mode
vim.opt.relativenumber = true   -- Relative line numbers
vim.opt.number = true           -- Line numbers [:set number!] to turn off
vim.opt.numberwidth = 5         -- We are good up to 99999 lines
vim.opt.sidescrolloff = 10      -- Keep 5 lines at the size
vim.opt.list = true             -- Show whitespace and tabs
vim.opt.listchars = { tab = "¦·", trail = "·" } -- Show tabs and trailing whitespace
vim.opt.clipboard = "unnamed"   -- Copy and paste with *
vim.opt.mouse = "a"             -- Scrollable term-vim
vim.opt.autoread = true         -- (default)
-- TextEdit might fail if hidden is not set.

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false          -- (default)
vim.opt.writebackup = false

-- Give more space for displaying messages.
vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append({ c = true })

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

-- Allow us to use Ctrl-s and Ctrl-q as keybinds
vim.cmd("silent !stty -ixon")

------------- Color Schemes ----------------
vim.opt.termguicolors = true
vim.cmd.colorscheme("heraldish")
