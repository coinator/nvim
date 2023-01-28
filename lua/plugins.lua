-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use("airblade/vim-gitgutter")
	use("ambv/black")
	use({
		"folke/zen-mode.nvim",
		opt = true,
		cmd = "ZenMode",
		config = function()
			require("lazyAfter/zen-settings")
		end,
	})
	use("folke/which-key.nvim")
	use({
		"kassio/neoterm",
		opt = true,
		cmd = { "TREPLSendLine", "TREPLSendFile", "TREPLSendSelection" },
	})
	use("KeitaNakamura/tex-conceal.vim") -- {"for": "tex"}
	use({
		"lervag/vimtex",
		ft = "tex",
	})
	use("lilydjwg/colorizer")
	use("neovim/nvim-lspconfig")
	use("numToStr/Comment.nvim")
	-- use "SirVer/ultisnips"
	use("L3MON4D3/LuaSnip")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")

	use({
		"mfussenegger/nvim-dap",
		ft = { "python" },
		config = function()
			require("lazyAfter/debug-settings")
			require("keemaps.dap-maps")
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		ft = { "python" },
		requires = { { "mfussenegger/nvim-dap" } },
		config = function()
			require("lazyAfter/debug-ui")
		end,
	})
	use("vim-test/vim-test")

	use({
		"vimwiki/vimwiki",
		opt = true,
		cmd = { "VimwikiIndex", "VimwikiDiaryIndex" },
	})

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("kdheepak/cmp-latex-symbols")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")

	-- Telescope
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	-- Aesthetic
	use("joshdick/onedark.vim")
	use("folke/tokyonight.nvim")
	use("morhetz/gruvbox")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = { { "nvim-treesitter/nvim-treesitter" } },
	})
	use({
		"nvim-treesitter/playground",
		opt = true,
		cmd = "TSPlaygroundToggle",
	})
	use("~/gv-plus.nvim")
	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
			})
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})
end)
