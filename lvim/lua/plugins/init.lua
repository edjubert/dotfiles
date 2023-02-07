return {
    {
        "max397574/colortils.nvim",
        cmd = "Colortils",
        config = function() require("colortils").setup() end
    },
    {
        "shortcuts/no-neck-pain.nvim",
        tag = "*"
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "phaazon/hop.nvim",
        branch = 'v2',
    },
    { "tpope/vim-surround" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-rhubarb" },
    { "rmagatti/goto-preview" },
    { "f-person/git-blame.nvim" },
    { "airblade/vim-gitgutter" },
    {
        "narutoxy/silicon.lua",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "simnalamburt/vim-mundo" },
    { "mitchellh/tree-sitter-proto" },
    { "tree-sitter/tree-sitter-go" },
    { "windwp/nvim-spectre" },
    { "danilamihailov/beacon.nvim" },
    { "MunifTanjim/eslint.nvim" },
    { "gbrlsnchs/winpick.nvim" },
    require('plugins.noice'),
    require('plugins.rust-tools'),
}
