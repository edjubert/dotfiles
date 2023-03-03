-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/edjubert/.cache/lvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/edjubert/.cache/lvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/edjubert/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/edjubert/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/edjubert/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nÒ\3\0\0\v\0\23\00166\0\0\0'\2\1\0B\0\2\0024\1\0\0006\2\2\0009\2\3\0029\2\4\0029\2\5\0029\2\6\2\15\0\2\0X\3\fÄ\21\2\1\0\22\2\0\0029\3\a\0006\5\b\0B\5\1\2'\6\t\0'\a\n\0'\b\v\0'\t\f\0'\n\r\0B\3\a\2<\3\2\0019\2\a\0006\4\14\0B\4\1\2'\5\15\0B\2\3\0029\3\16\0\18\5\2\0B\3\2\2\15\0\3\0X\4\3Ä\21\3\1\0\22\3\0\3<\2\3\0016\3\0\0'\5\17\0B\3\2\0029\3\18\3B\3\1\0016\3\0\0'\5\19\0B\3\2\0029\3\18\0035\5\20\0=\1\21\5B\3\2\0016\3\0\0'\5\22\0B\3\2\0029\3\18\3B\3\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0 luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\17is_directory\rsnippets\19get_config_dir\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\15join_paths\22friendly_snippets\fsources\fluasnip\fbuiltin\tlvim\15lvim.utils\frequire\2\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/danilamihailov/beacon.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["colortils.nvim"] = {
    commands = { "Colortils" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colortils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/colortils.nvim",
    url = "https://github.com/max397574/colortils.nvim"
  },
  ["eslint.nvim"] = {
    config = { "\27LJ\2\n›\2\0\0\b\0\15\0\0226\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0019\2\3\0015\4\4\0005\5\5\0005\6\6\0005\a\a\0=\a\b\6=\6\t\0055\6\n\0=\6\v\5=\5\f\0045\5\r\0=\5\14\4B\2\2\1K\0\1\0\16diagnostics\1\0\3%report_unused_disable_directives\1\venable\2\vrun_on\ttype\17code_actions\25disable_rule_comment\1\0\2\venable\2\rlocation\18separate_line\18apply_on_save\ntypes\1\4\0\0\fproblem\15suggestion\vlayout\1\0\1\venable\2\1\0\1\venable\2\1\0\1\bbin\reslint_d\nsetup\veslint\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/eslint.nvim",
    url = "https://github.com/MunifTanjim/eslint.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nl\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\3\22create_hl_autocmd\2\21uppercase_labels\1\18multi_windows\1\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.indentlines\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.lir\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/christianchiarulli/lir.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\16Information\f#0db9d7\fWarning\f#e0af68\nError\f#db4b4b\tHint\f#10B981\nsetup\15lsp-colors\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lunar.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/lunar.nvim",
    url = "https://github.com/lunarvim/lunar.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.mason\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.animate"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17mini.animate\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/mini.animate",
    url = "https://github.com/echasnovski/mini.animate"
  },
  ["mini.indentscope"] = {
    config = { "\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\28miniindentscope_disable\6b\bvimâ\2\1\2\a\0\15\0\0196\2\0\0009\2\1\0029\2\2\2'\4\3\0005\5\5\0005\6\4\0=\6\6\0053\6\a\0=\6\b\5B\2\3\0016\2\t\0'\4\n\0B\2\2\0029\2\v\0025\4\f\0005\5\r\0=\5\14\4B\2\2\1K\0\1\0\foptions\1\0\1\18try_as_border\2\1\0\1\vsymbol\b‚ñè\nsetup\21mini.indentscope\frequire\rcallback\0\fpattern\1\0\0\1\b\0\0\thelp\nalpha\14dashboard\rneo-tree\fTrouble\tlazy\nmason\rFileType\24nvim_create_autocmd\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/mini.indentscope",
    url = "https://github.com/echasnovski/mini.indentscope"
  },
  ["mini.trailspace"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mini.trailspace\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/mini.trailspace",
    url = "https://github.com/echasnovski/mini.trailspace"
  },
  ["neodev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["no-neck-pain.nvim"] = {
    config = { "\27LJ\2\nƒ\5\0\0\a\0\21\0\0265\0\0\0005\1\1\0=\1\2\0005\1\3\0=\1\4\0006\1\5\0'\3\6\0B\1\2\0029\2\a\0015\4\b\0005\5\t\0005\6\n\0=\6\2\0055\6\v\0=\6\4\5=\0\f\5=\0\r\5=\5\14\0045\5\16\0005\6\15\0=\6\17\0055\6\18\0=\6\19\5=\5\20\4B\2\2\1K\0\1\0\17integrations\rundotree\1\0\1\rposition\tleft\rNvimTree\1\0\0\1\0\1\rposition\tleft\fbuffers\nright\tleft\1\0\b\vnumber\1\tlist\1\19relativenumber\1\14linebreak\2\17cursorcolumn\1\twrap\2\15cursorline\1\15foldenable\1\1\0\5\rswapfile\1\fbuftype\vnofile\rfiletype\17no-neck-pain\14buflisted\1\14bufhidden\thide\1\0\2\rsetNames\1\nblend\3\0\1\0\6\24disableOnLastBuffer\1\28killAllBuffersOnDisable\1\nwidth\3ñ\1\18toggleMapping\15<Leader>np\ndebug\1\21enableOnVimEnter\2\nsetup\17no-neck-pain\frequire\awo\1\0\b\vnumber\1\tlist\1\19relativenumber\1\14linebreak\2\17cursorcolumn\1\twrap\2\15cursorline\1\15foldenable\1\abo\1\0\5\rswapfile\1\fbuftype\vnofile\rfiletype\17no-neck-pain\14buflisted\1\14bufhidden\thide\1\0\2\fenabled\2\nblend\3\0\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/no-neck-pain.nvim",
    url = "https://github.com/shortcuts/no-neck-pain.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n≠\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fpresets\1\0\5\18bottom_search\2\20command_palette\2\26long_message_to_split\2\15inc_rename\1\19lsp_doc_border\1\blsp\1\0\0\roverride\1\0\0\1\0\3 cmp.entry.get_documentation\0021vim.lsp.util.convert_input_to_markdown_lines\2\"vim.lsp.util.stylize_markdown\2\nsetup\nnoice\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5Ä6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.dap\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rsetup_ui\18lvim.core.dap\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fhlslens\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.breadcrumbs\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n˙\a\0\0\6\0(\00046\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0005\3\5\0=\3\6\0025\3\n\0005\4\b\0005\5\a\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\t\4=\4\14\0035\4\16\0005\5\15\0=\5\t\4=\4\17\0035\4\19\0005\5\18\0=\5\t\4=\4\20\0035\4\22\0005\5\21\0=\5\t\4=\4\23\0035\4\25\0005\5\24\0=\5\t\4=\4\26\3=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\0025\3!\0005\4 \0=\4\"\0035\4#\0=\4$\3=\3%\0025\3&\0=\3'\2B\0\2\1K\0\1\0\rhandlers\1\0\2\15diagnostic\2\vsearch\2\fautocmd\nclear\1\5\0\0\16BufWinLeave\rTabLeave\14TermLeave\rWinLeave\vrender\1\0\0\1\t\0\0\16BufWinEnter\rTabEnter\14TermEnter\rWinEnter\16CmdwinLeave\16TextChanged\15VimResized\16WinScrolled\23excluded_filetypes\1\3\0\0\vprompt\20TelescopePrompt\22excluded_buftypes\1\2\0\0\rterminal\nmarks\tMisc\1\0\2\rpriority\3\5\14highlight\vNormal\1\3\0\0\6-\6=\tHint\1\0\2\rpriority\3\4\14highlight\30DiagnosticVirtualTextHint\1\3\0\0\6-\6=\tInfo\1\0\2\rpriority\3\3\14highlight\30DiagnosticVirtualTextInfo\1\3\0\0\6-\6=\tWarn\1\0\2\rpriority\3\2\14highlight\30DiagnosticVirtualTextWarn\1\3\0\0\6-\6=\nError\1\0\2\rpriority\3\1\14highlight\31DiagnosticVirtualTextError\1\3\0\0\6-\6=\vSearch\1\0\0\ttext\1\0\2\rpriority\3\0\14highlight\vSearch\1\3\0\0\6-\6=\vhandle\1\0\3\24hide_if_all_visible\2\14highlight\17CursorColumn\ttext\6 \1\0\5\24show_in_active_only\1\tshow\2\14max_lines\1\19set_highlights\2\nfolds\3Ë\a\14scrollbar\nsetup\30scrollbar.handlers.search\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["peek.nvim"] = {
    config = { "\27LJ\2\nû\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\a\21close_on_bdelete\2\21update_on_change\2\vsyntax\2\ntheme\tdark\16throttle_at\3¿ö\f\18throttle_time\tauto\14auto_load\2\nsetup\tpeek\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/peek.nvim",
    url = "https://github.com/toppair/peek.nvim"
  },
  ["persistence.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\nÉ\2\0\2\t\0\15\0\0316\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\0\0\18\5\1\0B\2\3\0016\2\0\0'\4\3\0B\2\2\0026\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\b\0009\a\t\0029\a\t\a5\b\n\0=\1\v\bB\3\5\0016\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\f\0009\a\r\0029\a\r\a5\b\14\0=\1\v\bB\3\5\1K\0\1\0\1\0\0\22code_action_group\15<leader>lA\vbuffer\1\0\0\18hover_actions\14<C-space>\6n\bset\vkeymap\bvim\15rust-tools\21common_on_attach\rlvim.lsp\frequireÔ\3\1\0\a\0\26\0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\17\0005\3\3\0005\4\f\0004\5\t\0005\6\4\0>\6\1\0055\6\5\0>\6\2\0055\6\6\0>\6\3\0055\6\a\0>\6\4\0055\6\b\0>\6\5\0055\6\t\0>\6\6\0055\6\n\0>\6\a\0055\6\v\0>\6\b\5=\5\r\4=\4\14\0035\4\15\0=\4\16\3=\3\18\0025\3\21\0006\4\0\0'\6\19\0B\4\2\0029\4\20\4=\4\22\0033\4\23\0=\4\24\3=\3\25\2B\0\2\1K\0\1\0\vserver\14on_attach\0\fon_init\1\0\0\19common_on_init\rlvim.lsp\ntools\1\0\0\14runnables\1\0\1\18use_telescope\2\18hover_actions\vborder\1\0\1\15auto_focus\2\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\1\0\1\17autoSetHints\2\nsetup\15rust-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["silicon.lua"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fsilicon\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/silicon.lua",
    url = "https://github.com/narutoxy/silicon.lua"
  },
  ["structlog.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/structlog.nvim",
    url = "https://github.com/Tastyep/structlog.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["tree-sitter-go"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/tree-sitter-go",
    url = "https://github.com/tree-sitter/tree-sitter-go"
  },
  ["tree-sitter-proto"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/tree-sitter-proto",
    url = "https://github.com/mitchellh/tree-sitter-proto"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n‰\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\20\15treesitter\2\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\3\nalpha\4\0ÄÄÄˇ\3\fterm_bg\f#000000\rinactive\1\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.illuminate\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-mundo"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["winpick.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fwinpick\frequire\0" },
    loaded = true,
    path = "/home/edjubert/.local/share/lunarvim/site/pack/packer/start/winpick.nvim",
    url = "https://github.com/gbrlsnchs/winpick.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^neodev"] = "neodev.nvim",
  ["^persistence"] = "persistence.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-navic
time([[Config for nvim-navic]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.breadcrumbs\frequire\0", "config", "nvim-navic")
time([[Config for nvim-navic]], false)
-- Config for: peek.nvim
time([[Config for peek.nvim]], true)
try_loadstring("\27LJ\2\nû\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\a\21close_on_bdelete\2\21update_on_change\2\vsyntax\2\ntheme\tdark\16throttle_at\3¿ö\f\18throttle_time\tauto\14auto_load\2\nsetup\tpeek\frequire\0", "config", "peek.nvim")
time([[Config for peek.nvim]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.indentlines\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.mason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n≠\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fpresets\1\0\5\18bottom_search\2\20command_palette\2\26long_message_to_split\2\15inc_rename\1\19lsp_doc_border\1\blsp\1\0\0\roverride\1\0\0\1\0\3 cmp.entry.get_documentation\0021vim.lsp.util.convert_input_to_markdown_lines\2\"vim.lsp.util.stylize_markdown\2\nsetup\nnoice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n˙\a\0\0\6\0(\00046\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0005\3\5\0=\3\6\0025\3\n\0005\4\b\0005\5\a\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\t\4=\4\14\0035\4\16\0005\5\15\0=\5\t\4=\4\17\0035\4\19\0005\5\18\0=\5\t\4=\4\20\0035\4\22\0005\5\21\0=\5\t\4=\4\23\0035\4\25\0005\5\24\0=\5\t\4=\4\26\3=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\0025\3!\0005\4 \0=\4\"\0035\4#\0=\4$\3=\3%\0025\3&\0=\3'\2B\0\2\1K\0\1\0\rhandlers\1\0\2\15diagnostic\2\vsearch\2\fautocmd\nclear\1\5\0\0\16BufWinLeave\rTabLeave\14TermLeave\rWinLeave\vrender\1\0\0\1\t\0\0\16BufWinEnter\rTabEnter\14TermEnter\rWinEnter\16CmdwinLeave\16TextChanged\15VimResized\16WinScrolled\23excluded_filetypes\1\3\0\0\vprompt\20TelescopePrompt\22excluded_buftypes\1\2\0\0\rterminal\nmarks\tMisc\1\0\2\rpriority\3\5\14highlight\vNormal\1\3\0\0\6-\6=\tHint\1\0\2\rpriority\3\4\14highlight\30DiagnosticVirtualTextHint\1\3\0\0\6-\6=\tInfo\1\0\2\rpriority\3\3\14highlight\30DiagnosticVirtualTextInfo\1\3\0\0\6-\6=\tWarn\1\0\2\rpriority\3\2\14highlight\30DiagnosticVirtualTextWarn\1\3\0\0\6-\6=\nError\1\0\2\rpriority\3\1\14highlight\31DiagnosticVirtualTextError\1\3\0\0\6-\6=\vSearch\1\0\0\ttext\1\0\2\rpriority\3\0\14highlight\vSearch\1\3\0\0\6-\6=\vhandle\1\0\3\24hide_if_all_visible\2\14highlight\17CursorColumn\ttext\6 \1\0\5\24show_in_active_only\1\tshow\2\14max_lines\1\19set_highlights\2\nfolds\3Ë\a\14scrollbar\nsetup\30scrollbar.handlers.search\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: no-neck-pain.nvim
time([[Config for no-neck-pain.nvim]], true)
try_loadstring("\27LJ\2\nƒ\5\0\0\a\0\21\0\0265\0\0\0005\1\1\0=\1\2\0005\1\3\0=\1\4\0006\1\5\0'\3\6\0B\1\2\0029\2\a\0015\4\b\0005\5\t\0005\6\n\0=\6\2\0055\6\v\0=\6\4\5=\0\f\5=\0\r\5=\5\14\0045\5\16\0005\6\15\0=\6\17\0055\6\18\0=\6\19\5=\5\20\4B\2\2\1K\0\1\0\17integrations\rundotree\1\0\1\rposition\tleft\rNvimTree\1\0\0\1\0\1\rposition\tleft\fbuffers\nright\tleft\1\0\b\vnumber\1\tlist\1\19relativenumber\1\14linebreak\2\17cursorcolumn\1\twrap\2\15cursorline\1\15foldenable\1\1\0\5\rswapfile\1\fbuftype\vnofile\rfiletype\17no-neck-pain\14buflisted\1\14bufhidden\thide\1\0\2\rsetNames\1\nblend\3\0\1\0\6\24disableOnLastBuffer\1\28killAllBuffersOnDisable\1\nwidth\3ñ\1\18toggleMapping\15<Leader>np\ndebug\1\21enableOnVimEnter\2\nsetup\17no-neck-pain\frequire\awo\1\0\b\vnumber\1\tlist\1\19relativenumber\1\14linebreak\2\17cursorcolumn\1\twrap\2\15cursorline\1\15foldenable\1\abo\1\0\5\rswapfile\1\fbuftype\vnofile\rfiletype\17no-neck-pain\14buflisted\1\14bufhidden\thide\1\0\2\fenabled\2\nblend\3\0\0", "config", "no-neck-pain.nvim")
time([[Config for no-neck-pain.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\3\22create_hl_autocmd\2\21uppercase_labels\1\18multi_windows\1\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: silicon.lua
time([[Config for silicon.lua]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fsilicon\frequire\0", "config", "silicon.lua")
time([[Config for silicon.lua]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n‰\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\20\15treesitter\2\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\3\nalpha\4\0ÄÄÄˇ\3\fterm_bg\f#000000\rinactive\1\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.lir\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: mini.animate
time([[Config for mini.animate]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17mini.animate\frequire\0", "config", "mini.animate")
time([[Config for mini.animate]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\16Information\f#0db9d7\fWarning\f#e0af68\nError\f#db4b4b\tHint\f#10B981\nsetup\15lsp-colors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: eslint.nvim
time([[Config for eslint.nvim]], true)
try_loadstring("\27LJ\2\n›\2\0\0\b\0\15\0\0226\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0019\2\3\0015\4\4\0005\5\5\0005\6\6\0005\a\a\0=\a\b\6=\6\t\0055\6\n\0=\6\v\5=\5\f\0045\5\r\0=\5\14\4B\2\2\1K\0\1\0\16diagnostics\1\0\3%report_unused_disable_directives\1\venable\2\vrun_on\ttype\17code_actions\25disable_rule_comment\1\0\2\venable\2\rlocation\18separate_line\18apply_on_save\ntypes\1\4\0\0\fproblem\15suggestion\vlayout\1\0\1\venable\2\1\0\1\venable\2\1\0\1\bbin\reslint_d\nsetup\veslint\fnull-ls\frequire\0", "config", "eslint.nvim")
time([[Config for eslint.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nÒ\3\0\0\v\0\23\00166\0\0\0'\2\1\0B\0\2\0024\1\0\0006\2\2\0009\2\3\0029\2\4\0029\2\5\0029\2\6\2\15\0\2\0X\3\fÄ\21\2\1\0\22\2\0\0029\3\a\0006\5\b\0B\5\1\2'\6\t\0'\a\n\0'\b\v\0'\t\f\0'\n\r\0B\3\a\2<\3\2\0019\2\a\0006\4\14\0B\4\1\2'\5\15\0B\2\3\0029\3\16\0\18\5\2\0B\3\2\2\15\0\3\0X\4\3Ä\21\3\1\0\22\3\0\3<\2\3\0016\3\0\0'\5\17\0B\3\2\0029\3\18\3B\3\1\0016\3\0\0'\5\19\0B\3\2\0029\3\18\0035\5\20\0=\1\21\5B\3\2\0016\3\0\0'\5\22\0B\3\2\0029\3\18\3B\3\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0 luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\17is_directory\rsnippets\19get_config_dir\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\15join_paths\22friendly_snippets\fsources\fluasnip\fbuiltin\tlvim\15lvim.utils\frequire\2\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: winpick.nvim
time([[Config for winpick.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fwinpick\frequire\0", "config", "winpick.nvim")
time([[Config for winpick.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5Ä6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rsetup_ui\18lvim.core.dap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: mini.trailspace
time([[Config for mini.trailspace]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mini.trailspace\frequire\0", "config", "mini.trailspace")
time([[Config for mini.trailspace]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Colortils lua require("packer.load")({'colortils.nvim'}, { cmd = "Colortils", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType rs ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rs" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'mini.indentscope'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'which-key.nvim', 'bufferline.nvim', 'toggleterm.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'persistence.nvim', 'mini.indentscope'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-ts-context-commentstring'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'Comment.nvim', 'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
