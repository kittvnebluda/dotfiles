return {
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        fomratters_by_ft = {
            lua = { "stylua" },
            sh = { "shfmt" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
    },
}
