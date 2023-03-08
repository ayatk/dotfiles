return {
  { "cocopon/iceberg.vim", lazy = false }, -- colorscheme
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    lazy = false,
    opts = { options = { icons_enabled = false, section_separators = "", component_separators = "|" } },
  },
  { "mvllow/modes.nvim", event = "ModeChanged", config = true },
  { "nvim-treesitter/nvim-treesitter", event = "BufNewFile, BufRead" }, -- シンタックスハイライト
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
  { "pocco81/auto-save.nvim", event = "InsertLeave, TextChanged", config = true },
}
