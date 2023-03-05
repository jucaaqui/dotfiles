vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>bj", ":!make VST3 -C Builds/LinuxMakefile")
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>rp", ":!python3 "..vim.api.nvim_buf_get_name(0))


-- undo tree remaps
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- telescope remaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- nerdtree remaps
vim.keymap.set("n", "<leader>t", vim.cmd.NERDTreeToggle)


