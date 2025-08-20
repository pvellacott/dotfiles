return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                "c", "cpp", "c_sharp", "rust", "gdscript", "gdshader",
                "javascript", "typescript", "go", "json",
                "svelte", "css", "hlsl", "dockerfile", "zig", "html"
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
