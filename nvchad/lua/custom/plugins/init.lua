local overrides = require("custom.plugins.overrides")

---@type {[PluginName]: PluginConfig|false}
local plugins = {

	["goolord/alpha-nvim"] = { disable = false },

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- overrde plugin configs
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["nvim-tree/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	-- Install a plugin
	["max397574/better-escape.nvim"] = {
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	["tpope/vim-surround"] = {
		override_options = overrides.vimsurround,
	},

	["tpope/vim-fugitive"] = {
		override_options = overrides.vimfugitive,
	},

	["tpope/vim-rhubarb"] = {
		override_options = overrides.vimrhubarb,
	},

	["f-person/git-blame.nvim"] = {
		override_options = overrides.gitblame,
	},

	["danilamihailov/beacon.nvim"] = {
		override_options = overrides.beaconnvim,
	},

	["rmagatti/goto-preview"] = {
		override_options = overrides.gotopreview,
		config = function()
			require("goto-preview").setup({})
		end,
	},

	["psliwka/vim-smoothie"] = {
		override_options = overrides.vimsmoothie,
	},

	["airblade/vim-gitgutter"] = {
		override_options = overrides.vimgitgutter,
	},

	["ray-x/lsp_signature.nvim"] = {
		override_options = overrides.lspsignature,
		config = function()
			require("lsp_signature").setup({
				bind = true,
				handler_opts = {
					border = "rounded",
				},
			})
		end,
	},

	["RRethy/vim-hexokinase"] = {
		override_options = overrides.vimhexokinase,
		run = "make hexokinase",
	},

	["max397574/colortils.nvim"] = {
		override_options = overrides.colortils,
		cmd = "Colortils",
		config = function()
			require("colortils").setup()
		end,
	},

	["tree-sitter/tree-sitter-go"] = {
		override_options = overrides.treesittergo,
	},

	["gbrlsnchs/winpick.nvim"] = {
		override_options = overrides.winpick,
	},

	["windwp/nvim-spectre"] = {
		override_options = overrides.nvimspectre,
	},

	["MunifTanjim/eslint.nvim"] = {
		override_options = overrides.eslint,
		config = function()
			require("eslint").setup({
				bin = "eslint",
				code_actions = {
					enable = true,
					apply_on_save = {
						enable = true,
						types = { "problem", "suggestion", "layout" },
					},
					disable_rule_comment = {
						enable = true,
						location = "separate_line",
					},
				},
				diagnostics = {
					enable = true,
					report_unused_disable_directives = false,
					run_on = "type",
				},
			})
		end,
	},

	["mitchellh/tree-sitter-proto"] = {
		override_options = overrides.treesitterproto,
	},

	["rcarriga/nvim-notify"] = {
		override_options = overrides.nvimnotify,
		config = function()
			require("telescope").load_extension("notify")
			require("notify").setup({
				background_colour = "Normal",
				fps = 60,
				timeout = 2000,
				render = "default",
				stages = "slide",
			})
		end,
	},

	["simnalamburt/vim-mundo"] = {
		override_options = overrides.vimmundo,
	},

	["shortcuts/no-neck-pain.nvim"] = {
		override_options = overrides.noneckpain,
		version = "*",
		config = function()
			require("no-neck-pain").setup({
				debug = false,
				enableOnVimEnter = true,
				width = 150,
				toogleMapping = "<leader>np",
				disableOnLastBuffer = false,
				killAllBuffersOnDisable = false,
				buffers = {
					setNames = false,
					backgroundColor = nil,
					blend = 0,
					textColor = nil,
					bo = {
						filetype = "no-neck-pain",
						buftype = "nofile",
						bufhidden = "hide",
						buflisted = false,
						swapfile = false,
					},
					wo = {
						cursorline = false,
						cursorcolumn = false,
						number = false,
						relativenumber = false,
						foldenable = false,
						list = false,
						wrap = true,
						linebreak = true,
					},
					left = {
						enabled = true,
						backgroundColor = nil,
						blend = 0,
						textColor = nil,
						bo = {
							filetype = "no-neck-pain",
							buftype = "nofile",
							bufhidden = "hide",
							buflisted = false,
							swapfile = false,
						},
						wo = {
							cursorline = false,
							cursorcolumn = false,
							number = false,
							relativenumber = false,
							foldenable = false,
							list = false,
							wrap = true,
							linebreak = true,
						},
					},
					right = {
						enabled = true,
						backgroundColor = nil,
						blend = 0,
						textColor = nil,
						bo = {
							filetype = "no-neck-pain",
							buftype = "nofile",
							bufhidden = "hide",
							buflisted = false,
							swapfile = false,
						},
						wo = {
							cursorline = false,
							cursorcolumn = false,
							number = false,
							relativenumber = false,
							foldenable = false,
							list = false,
							wrap = true,
							linebreak = true,
						},
					},
				},
				integrations = {
					NvimTree = {
						position = "left",
					},
					undotree = {
						position = "left",
					},
				},
			})
		end,
	},

	["phaazon/hop.nvim"] = {
		override_options = overrides.hop,
		branch = "v2",
		config = function()
			require("hop").setup()
		end,
	},

	["folke/trouble.nvim"] = {
		override_options = overrides.trouble,
		config = function()
			require("trouble").setup()
		end,
	},

	["folke/which-key.nvim"] = {
		override_options = overrides.whichkey,
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		override_options = overrides.indentblankline,
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},

	["kdheepak/lazygit.nvim"] = {
		override_options = overrides.lazygitnvim,
	},

	-- remove plugin
	-- ["hrsh7th/cmp-path"] = false,
}

return plugins