return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "C-h", ":TmuxNavigationLeft<CR>"),
	vim.keymap.set("n", "C-j", ":TmuxNavigationDown<CR>"),
	vim.keymap.set("n", "C-k", ":TmuxNavigationUp<CR>"),
	vim.keymap.set("n", "C-l", ":TmuxNavigationLeft<CR>"),
}
