return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
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
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
        vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "[S]earch [O]ld files" })
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })
    end,
}
