vim.g.mapleader = " "

-- Keymaps

local key = vim.keymap
key.set("n", "<leader>e", vim.cmd.Ex)
-- Move lines
key.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==")
key.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
key.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
key.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
key.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv")
key.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv")
-- Buffers
key.set("n", "<S-h>", "<cmd>bprevious<cr>")
key.set("n", "<S-l>", "<cmd>bnext<cr>")
key.set("n", "<leader>bd", vim.cmd.bdelete)
key.set("n", "[b", "<cmd>bprevious<cr>")
key.set("n", "]b", "<cmd>bnext<cr>")
-- Better identing
key.set("x", "<", "<gv")
key.set("x", ">", ">gv")
-- Clear search with <Esc>
key.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
-- Greatest remap ever
key.set("x", "<leader>p", "\"_dP")


-- Editor settings

local opt = vim.opt
opt.numberwidth = 1
opt.number = true
opt.relativenumber = true
-- opt.signcolumn = "no"
opt.cursorline = false
opt.clipboard = "unnamedplus"
opt.guicursor = ""
opt.mouse = "a"
opt.signcolumn = "no"
opt.confirm = true
opt.cursorline = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.linebreak = false
opt.ruler = true
opt.smoothscroll = true
opt.splitbelow = true
opt.splitright = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.termguicolors = true

--Hightligh yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 100,
    })
  end,
})

-- Diagnostics

vim.diagnostic.config({
  -- virtual_text = {
  --   prefix = '●',
  -- },
  -- underline = true,
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '●',
      [vim.diagnostic.severity.WARN]  = '●',
      [vim.diagnostic.severity.HINT]  = '●',
      [vim.diagnostic.severity.INFO]  = '●',
    },
  },
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  undercurl = true,
  sp = "#ffc0b9"
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  undercurl = true,
  sp = "#fce094"
})

key.set("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<cr>")
