local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("BufWritePre", {
  pattern = "*",
  command = "lua vim.lsp.buf.formatting()",
})

vim.o.guifont = "Iosevka Nerd Font"
vim.g.smoothie_experimental_mappings = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum .'' : v:lnum) : ''}%=%"
