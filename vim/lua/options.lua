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

require('lualine').setup {
  options = {
    theme = "catppuccin"
    -- ... the rest of your lualine config
  }
}

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
