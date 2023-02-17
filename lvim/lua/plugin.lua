local plugins = require('plugins.init')

-- Additional Plugins
lvim.plugins = { plugins }


require('cmp').setup({
    sources = {
        { name = 'path' }
    }
})
