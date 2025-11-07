return {
	"octoenergy/kraken.nvim",
	keys = {
		{
			"<leader>lt",
			"<cmd>KLocateTests<cr>",
			desc = "Locate test file(s)",
		},
		{
			"<leader>pr",
			"<cmd>KCreateSlackPrLink<cr>",
			desc = "Copy formatted PR link",
		},
	},
	lazy = true,
	-- dev = true,
	opts = {
		commands = {
			locate_tests = {
				open_command = "lefta vsp",
			},
		},
		picker = "picker",
	},
}
