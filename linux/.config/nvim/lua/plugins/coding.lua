return {
	"tpope/vim-commentary",
	"dbakker/vim-paragraph-motion",
	{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'mfussenegger/nvim-lint',
	{
	  'stevearc/conform.nvim',
	  opts = {},
	},
	{
	    "nvim-treesitter/nvim-treesitter",
	    build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	    end,
	},
	"HiPhish/rainbow-delimiters.nvim"
}

