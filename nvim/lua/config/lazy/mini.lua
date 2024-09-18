return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.diff").setup({ view = { style = "sign", signs = { add = "+", change = "~", delete = "-" } } })
        require("mini.comment").setup()
        require("mini.surround").setup()
    end,
}
