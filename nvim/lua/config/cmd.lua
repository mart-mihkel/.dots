vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Explore on open",
    callback = function()
        if vim.tbl_count(vim.v.argv) == 2 then
            vim.cmd("Explore")
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
