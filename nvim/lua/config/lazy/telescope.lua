return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    config = function()
        require("telescope").setup({
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                color_devicons = false,
                selection_caret = "",
                prompt_prefix = "",
                entry_prefix = "",
                multi_icon = "",
                preview = { msg_bg_fillchar = " " },
                layout_config = {
                    anchor = "N",
                    mirror = true,
                    prompt_position = "top",
                    width = { padding = 0 },
                    height = { padding = 0 },
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "search help" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "search files" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "search by grep" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "search resume" })
        vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "search recent files" })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "find existing buffers" })
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "search current buffer" })
    end,
}
