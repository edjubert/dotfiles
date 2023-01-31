return {
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-commentary" },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup()
    end,
  },
  { "f-person/git-blame.nvim" },
  { "airblade/vim-gitgutter" },
  {
    "narutoxy/silicon.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("silicon").setup()
    end,
  },
  { "gbrlsnchs/winpick.nvim" },
  { "simnalamburt/vim-mundo" },
  { "mitchellh/tree-sitter-proto" },
  { "tree-sitter/tree-sitter-go" },
  { "windwp/nvim-spectre" },
  { "danilamihailov/beacon.nvim" },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
}
