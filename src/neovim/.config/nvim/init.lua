-- packer
require("plugins")

-- plugin configuration files
require("configs.tree-sitter")
require("configs.telescope")
require("configs.nvim-tree")
require("configs.comment")
require("configs.lsp")
require("configs.bufferline")
require("configs.statusline")


local opt = vim.o
local glob = vim.g
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap


-- colorscheme
glob.gruvbox_italic=1
glob.gruvbox_bold=1
glob.gruvbox_contrast_dark="hard"
cmd([[colorscheme gruvbox]])

opt.termguicolors = true
opt.relativenumber = true
opt.lazyredraw = true
opt.number = true
opt.splitbelow = true
opt.splitright = true
opt.hlsearch = false
opt.wrap = false
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.laststatus = 3
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.colorcolumn = "81,82"
opt.completeopt = "menu,menuone,noselect"

-- keybinds
local opts = { noremap = true }
glob.mapleader = " "

-- reload current file (use only for vim or lua files related to neovim config)
map("n", "<leader>r", ":so %<cr>", opts)
-- compile
map("n", "<leader>m", ":make<cr>", opts)

-- file explorer
map("n", "<leader>n", ":NvimTreeToggle<cr>", opts)
map("n", "<leader>e", ":NvimTreeFocus<cr>", opts)

-- close buffer
map("n", "<leader>d", ":bp|bd#<cr>", opts)

-- switch between splits
map("n", "<leader>h", ":wincmd h<cr>", opts)
map("n", "<leader>j", ":wincmd j<cr>", opts)
map("n", "<leader>k", ":wincmd k<cr>", opts)
map("n", "<leader>l", ":wincmd l<cr>", opts)

-- telescope pickers
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- switch to previous/next buffer
map("n", "<s-tab>", ":bp<cr>", opts)
map("n", "<tab>", ":bn<cr>", opts)

-- resize splits
map("n", "<left>", ":vertical resize -2<cr>", opts)
map("n", "<right>", ":vertical resize +2<cr>", opts)
map("n", "<down>", ":resize -2<cr>", opts)
map("n", "<up>", ":resize +2<cr>", opts)
