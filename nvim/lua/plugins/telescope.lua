
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },

        cmd = "Telescope",

        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            preview_width = 0.55,
                        },
                    },
                },
            })

            local map = vim.keymap.set

            map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            map("n", "<leader>fg", builtin.live_grep, { desc = "Search text" })
            map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
            map("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
            map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
            map("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
            map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
        end,
    },
}
