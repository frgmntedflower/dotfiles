
return {
    -- Keybind discovery
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Better statusline
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.statusline").setup()
            require("mini.surround").setup()
            require("mini.pairs").setup()
        end,
    },

    -- File explorer
    {
        "echasnovski/mini.files",
        version = false,
        keys = {
            {
                "<leader>e",
                function()
                    require("mini.files").open()
                end,
                desc = "File explorer",
            },
        },
        config = function()
            require("mini.files").setup({
                windows = {
                    preview = true,
                    width_focus = 30,
                    width_nofocus = 15,
                },
            })
        end,
    },
}
