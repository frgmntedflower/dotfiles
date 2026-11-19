
local opt = vim.opt

-- General
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Tabs
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Editing
opt.wrap = false
opt.smartindent = true
opt.breakindent = true
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Performance / responsiveness
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = "menu,menuone,noselect"

-- Window behavior
opt.splitright = true
opt.splitbelow = true

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

-- Disable noisy intro screen
opt.shortmess:append("I")
