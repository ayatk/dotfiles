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
vim.cmd.colorscheme("iceberg")
