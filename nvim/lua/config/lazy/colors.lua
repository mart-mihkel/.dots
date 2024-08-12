return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1024,
	config = function()
		local black = { base = "#000000", bright = "#1f2328" }
		local telescope_border = { bg = "#ffffff", fg = "#ffffff" }

		require("github-theme").setup({
			options = {
				hide_end_of_buffer = false,
				transparent = true,
			},
			palettes = {
				github_light_high_contrast = {
					blue = black,
				},
			},
		})

		vim.api.nvim_set_hl(0, "TelescopePromptBorder", telescope_border)
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", telescope_border)
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", telescope_border)

		vim.cmd("colorscheme github_light_high_contrast")
	end,
}
