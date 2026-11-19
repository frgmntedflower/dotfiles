
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "lua",
                    "vim",
                    "vimdoc",
                    "bash",
                    "cmake",
                    "json",
                    "yaml",
                    "markdown",
                    "markdown_inline",
                },
                highlight = {
                    enable = true,
                },
            })
        end,
    },
}
