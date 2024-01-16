return {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{'<leader>ff', '<cmd>Telescope find_files<cr>', desc = "Find files"},
		{'<C-p>', '<cmd>Telescope git_files<cr>', desc = "Find git files"},
		{'<leader>fg', '<cmd>Telescope live_grep<cr>', desc = "Grep files"},
		{'<leader>fb', '<cmd>Telescope buffers shorten_path=true<cr>', desc = "Search open buffers"},
	},
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = {
            "smart"
          },
        },
      })
    end
}
