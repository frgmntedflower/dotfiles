
return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },

        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    c = { "clang_format" },
                    cpp = { "clang_format" },
                    lua = { "stylua" },
                    python = { "black" },
                },

                format_on_save = {
                    timeout_ms = 1000,
                    lsp_format = "fallback",
                },
            })

            vim.keymap.set("n", "<leader>fm", function()
                require("conform").format({
                    async = true,
                    lsp_format = "fallback",
                })
            end, { desc = "Format file" })
        end,
    },
}

