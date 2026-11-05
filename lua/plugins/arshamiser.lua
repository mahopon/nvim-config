return {
	"arsham/arshamiser.nvim",
	dependencies = {
		"rebelot/heirline.nvim",
		"nvim-lualine/lualine.nvim",
		"kyazdani42/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		-- ignore any parts you don't want to use
		vim.cmd.colorscheme("arshamiser_light")
		require("arshamiser.lualiner")
		-- or:
		-- require("arshamiser.heirliniser")

		_G.custom_foldtext = require("arshamiser.folding").foldtext
		vim.opt.foldtext = "v:lua.custom_foldtext()"
		-- if you want to draw a tabline:
		vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
	end,
}
