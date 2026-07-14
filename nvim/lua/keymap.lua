vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.opt.exrc = true
vim.keymap.set("n", "<leader>wt", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", {})
