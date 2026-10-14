-- bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- colorscheme
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = { options = { icons_enabled = false, section_separators = "", component_separators = "|" } },
  },
  { "mvllow/modes.nvim", event = "ModeChanged", config = true },
  -- { "nvim-treesitter/nvim-treesitter", event = "BufNewFile, BufRead" }, -- シンタックスハイライト
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, cmd = "Telescope" }, -- fuzzy finder
  { "windwp/nvim-autopairs", event = "BufEnter", config = true },
  {
    "acro5piano/nvim-format-buffer",
    event = "BufWritePre",
    opts = {
      format_rules = {
        { pattern = { "*.lua" }, command = "stylua -" },
      },
    },
  },
  -- { "pocco81/auto-save.nvim", event = "InsertLeave, TextChanged", config = true },
})

-- options
local options = {
  -- base
  encoding = "utf-8",
  fileencoding = "utf-8",
  fileformats = "unix,dos,mac", -- 改行コードの自動判別. 左側が優先される
  ambiwidth = "double", -- □や○文字が崩れる問題を解決
  title = true,
  backup = false,
  clipboard = "unnamedplus",
  incsearch = true, -- set incremental search
  showmatch = true, -- show corresponds bracket
  tabstop = 4,
  shiftwidth = 0, -- 0 で tabstop と同じ幅を使う

  -- key
  backspace = "indent,eol,start",

  -- editor
  expandtab = true, -- convert tab to space
  autoindent = true, -- 改行時に前の行のインデントを継続する
  smartindent = true, -- 改行時に前の行の構文をチェックし次の行のインデントを増減する

  -- visual
  ruler = true,
  hlsearch = true, -- 検索した時にハイライトする
  number = true,
  relativenumber = false,
  cursorline = true,
  ruler = true,
  laststatus = 2, -- status lineを表示
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- visual
vim.cmd.syntax("enable")

-- colorscheme
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = { "*" },
  callback = function()
    local hl_groups = { "Normal", "NonText", "LineNr", "Folded", "EndOfBuffer" }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
    end
  end,
})

require("catppuccin").setup({
  flavour = "auto", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "macchiato",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  color_overrides = {},
  custom_highlights = {},
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
        enabled = true,
        indentscope_color = "",
    },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- keymaps

vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"

local map = vim.keymap.set
local silent = { silent = true }

map("i", "jj", "<Esc>", silent)
map("i", "<C-j>", "<C-[>")

-- 折り返し行は論理行ではなく表示行単位で移動する。
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<Down>", "gj")
map("n", "<Up>", "gk")

map("n", "s", "<Nop>")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")
map("n", "sh", "<C-w>h")
map("n", "sJ", "<C-w>J")
map("n", "sK", "<C-w>K")
map("n", "sL", "<C-w>L")
map("n", "sH", "<C-w>H")
map("n", "sn", "gt")
map("n", "sp", "gT")
map("n", "sr", "<C-w>r")
map("n", "s=", "<C-w>=")
map("n", "sw", "<C-w>w")
map("n", "so", "<C-w>_<C-w>|")
map("n", "sO", "<C-w>=")
map("n", "sN", "<Cmd>bnext<CR>", silent)
map("n", "sP", "<Cmd>bprevious<CR>", silent)
map("n", "st", "<Cmd>tabnew<CR>", silent)
map("n", "ss", "<Cmd>split<CR>", silent)
map("n", "sv", "<Cmd>vsplit<CR>", silent)
map("n", "sq", "<Cmd>quit<CR>", silent)
map("n", "sQ", "<Cmd>bdelete<CR>", silent)

map("n", "sT", function()
  local has_telescope_builtin, builtin = pcall(require, "telescope.builtin")
  if has_telescope_builtin and builtin.tabs then
    builtin.tabs()
    return
  end

  vim.cmd.tabs()
end, silent)
