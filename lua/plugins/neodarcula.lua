return {
    {
        "pmouraguedes/neodarcula.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true, -- Enable transparent background
            dim = true,         -- Dim inactive windows with a black background
        },
        config = function(_, opts)
            require("neodarcula").setup(opts)
            vim.cmd.colorscheme("neodarcula")
        end,
    },
}
