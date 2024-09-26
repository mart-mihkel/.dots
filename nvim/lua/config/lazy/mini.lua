return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.comment").setup()
        require("mini.diff").setup({
            view = {
                style = "sign",
                signs = { add = "+", change = "~", delete = "-" }
            }
        })
        -- [colors.normal]
        -- black = "#181818"
        -- red = "#ac4242"
        -- green = "#90a959"
        -- yellow = "#f4bf75"
        -- blue = "#6a9fb5"
        -- magenta = "#aa759f"
        -- cyan = "#75b5aa"
        -- white = "#d8d8d8"

        -- [colors.bright]
        -- black = "#6b6b6b"
        -- red = "#c55555"
        -- green = "#aac474"
        -- yellow = "#feca88"
        -- blue = "#82b8c8"
        -- magenta = "#c28cb8"
        -- cyan = "#93d3c3"
        -- white = "#f8f8f8"
        -- require("mini.base16").setup({
        --     palette = {
        --         base00 = "#f8f8f8", -- default background
        --         base01 = "#f8f8f8", -- lighter background
        --         base02 = "#d0d0d0", -- selection background
        --         base03 = "#d8d8d8", -- comments
        --         base04 = "#6b6b6b", -- dark foreground
        --         base05 = "#303030", -- default foreground
        --         base06 = "#202020", -- light foreground
        --         base07 = "#151515", -- light background
        --         base08 = "#ac4142", -- variables
        --         base09 = "#d28445", -- integers
        --         base0A = "#f4bf75", -- classes
        --         base0B = "#90a959", -- strings
        --         base0C = "#75b5aa", -- regex
        --         base0D = "#6a9fb5", -- functions
        --         base0E = "#aa759f", -- keywords
        --         base0F = "#8f5536", -- deprecated
        --
        --     }
        -- })
    end,
}
