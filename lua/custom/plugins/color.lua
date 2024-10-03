return {
	{
		"olimorris/onedarkpro.nvim",
		config = function()
			--vim.g.rasmus_italic_comments = false
			--vim.g.rasmus_bold_comments = false
			--vim.g.rasmus_italic_keywords = true
			--vim.g.rasmus_bold_keywords = false
			--vim.g.rasmus_italic_booleans = false
			--vim.g.rasmus_bold_booleans = false
			--vim.g.rasmus_italic_functions = false
			--vim.g.rasmus_bold_functions = true
			--vim.g.rasmus_italic_variables = false
			--vim.g.rasmus_bold_variables = false


			vim.cmd.colorscheme("onedark")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NormalFloat",
					"FloatBorder",
				},
			})
		end,
	},
}
