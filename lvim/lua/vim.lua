-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])
vim.cmd([[ set mousemodel=extend ]])
vim.g.smoothie_experimental_mappings = true
vim.api.nvim_command([[
  augroup transparentBackground
    autocmd colorscheme * :hi CursorLine ctermbg=NONE cterm=bold guibg=NONE gui=bold
    autocmd colorscheme * :hi TelescopeNormal ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi TelescopeBorder ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi FloatBorder ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi NormalFloat ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi NvimTreeNormal ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi NvimTreeRootFolder ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi WhichKey ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi WhichKeyGroup ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi WhichKeyFloat ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi BufferLineFill ctermbg=NONE guibg=NONE
    autocmd colorscheme * :hi Visual cterm=bold gui=bold
    autocmd colorscheme * :hi Comment cterm=italic gui=italic
    autocmd colorscheme * :hi NotifyBackground cterm=italic gui=italic
  augroup END
]])

vim.opt.numberwidth = 3
vim.opt.relativenumber = false
