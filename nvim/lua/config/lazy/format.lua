return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            ["_"] = { "trim_whitespace" },
        },
    },
    config = function()
        local format = function()
            require("conform").format({ async = true, lsp_format = "fallback" })
        end

        vim.keymap.set({ "n", "v" }, "<leader>f", format, { desc = "Format" })
    end
}
