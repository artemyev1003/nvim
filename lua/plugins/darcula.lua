return {
	{
		"briones-gabriel/darcula-solid.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("darcula-solid")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		end,
	}
}

