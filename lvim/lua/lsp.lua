-- generic LSP settings
-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    "sumneko_lua",
    "jsonls",
    "gopls",
    "tsserver",
}
