return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        opts.build_config = {
            executable = "tree-sitter",
        }
        opts.ignore_install = { "latex" }
    end,
}
