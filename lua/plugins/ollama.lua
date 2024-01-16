return {
    "David-Kunz/gen.nvim",
    keys = {
        { "<leader>oo", "<cmd>Gen<cr>", mode= {"n", "v"} },
    },
    config = function()
      require("gen").model = "codellama"
    end
}
