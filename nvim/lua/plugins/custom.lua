return {
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "f-person/git-blame.nvim" },
  { "airblade/vim-gitgutter" },
  { "gbrlsnchs/winpick.nvim" },
  { "simnalamburt/vim-mundo" },
  { "mitchellh/tree-sitter-proto" },
  { "tree-sitter/tree-sitter-go" },
  { "windwp/nvim-spectre" },
  { "danilamihailov/beacon.nvim" },
  { "phaazon/hop.nvim" },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
  {
    "RRethy/vim-hexokinase",
    run = "make hexokinase",
  },
}
