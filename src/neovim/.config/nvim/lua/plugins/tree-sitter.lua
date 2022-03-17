require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
        "lua",
        "css",
        "html",
        "php",
        "javascript",
        "c",
        "cpp",
        "java",
        "python"
    },

    sync_install = false,
    ignore_install = { },
    highlight = {
        enable = true,
        disable = { },
        additional_vim_regex_highlighting = false,
    },
}
