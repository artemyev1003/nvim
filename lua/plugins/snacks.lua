return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = false },
            dashboard = { enabled = false },
            explorer = { enabled = true },
            indent = { enabled = false },
            input = { enabled = false },
            picker = { enabled = true,
            sources = {
                explorer = { hidden = true },
                files = { hidden = true },
                grep = { hidden = true },
            },
            layout = {
                auto_hide = {"input"},
            },
        },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
    keys = {
        { "<leader>e", function() Snacks.explorer.open() end, desc = "File Explorer" },
    }
}
}
