local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap("n", "<Space>nt", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Space>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<Space>fd", ":Telescope live_grep<CR>", opts)
keymap("n", "<Space>pr", ":PackerSync<CR>", opts)
keymap("i", "jk", "<ESC>", opts)

