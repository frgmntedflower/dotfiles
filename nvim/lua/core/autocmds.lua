
local group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = group,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line = mark[1]

        if line > 1 and line <= vim.api.nvim_buf_line_count(0) then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- C++ indentation
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "c", "cpp", "objc", "objcpp" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})
