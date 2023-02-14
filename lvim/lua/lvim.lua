-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"
lvim.leader = "space"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false


lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.git_files.previewer = nil
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.width = 0.8

-- equire('telescope.builtin').find_files({ layout_strategy = 'vertical', layout_config = { width = 0.5 } })
-- lua
-- require('telescope.builtin').find_files({ layout_strategy = 'vertical', layout_config = { width = 0.5 } })
