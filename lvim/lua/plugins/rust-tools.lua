return {
  "simrat39/rust-tools.nvim",
  ft = { "rust", "rs" },
  config = function ()
    -- local lsp_installer_servers = require("nvim-lsp-installer.servers")
    -- local _, requested_server = lsp_installer_servers.get_server("rust_analyzer")
    require("rust-tools").setup({
        tools = {
            autoSetHints = true,
            -- hover_with_actions = true,
            -- options same as lsp hover / vim.lsp.util.open_floating_preview()
            hover_actions = {

                -- the border that is used for the hover window
                -- see vim.api.nvim_open_win()
                border = {
                    { "╭", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╮", "FloatBorder" },
                    { "│", "FloatBorder" },
                    { "╯", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╰", "FloatBorder" },
                    { "│", "FloatBorder" },
                },

                -- whether the hover action window gets automatically focused
                -- default: false
                auto_focus = true,
            },
            runnables = {
                use_telescope = true,
            },
        },
        server = {
            on_init = require("lvim.lsp").common_on_init,
            on_attach = function(client, bufnr)
              require("lvim.lsp").common_on_attach(client, bufnr)
              local rt = require("rust-tools")
              -- Hover actions
              vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
              -- Code action groups
              vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
        },
    })
  end
}
