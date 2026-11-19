
return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },

        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            })

            local map = vim.keymap.set

            map("n", "<leader>hp", require("gitsigns").preview_hunk, { desc = "Preview hunk" })
            map("n", "<leader>hs", require("gitsigns").stage_hunk, { desc = "Stage hunk" })
            map("n", "<leader>hr", require("gitsigns").reset_hunk, { desc = "Reset hunk" })
            map("n", "<leader>hb", require("gitsigns").blame_line, { desc = "Blame line" })
        end,
    },
}
