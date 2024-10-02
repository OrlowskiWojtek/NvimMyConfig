return {
	"jpalardy/vim-slime",
    config = function()
        vim.g.slime_target = "kitty"
        vim.g.slime_cell_delimiter = "##"
        vim.keymap.set('n', '<C-r>', '<Plug>SlimeSendCell<CR>')
    end,
}
