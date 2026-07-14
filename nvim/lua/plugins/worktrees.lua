local python = function(path)
	vim.env.PYTHONPATH = path .. "/src"
	vim.env.VIRTUAL_ENV = path .. "/.venv"
	vim.env.PATH = path .. "/.venv/bin:" .. vim.env.PATH
end

local is_python = function(path)
	return exists(path .. "/pyproject.toml") or exists(path .. "/requirements.txt") or exists(path .. "/setup.py")
end

local on_switch = function(metadata)
	if is_python(metadata.path) then
		python(metadata.path)
	end

	vim.cmd.cd(metadata.path)
end

return {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = "nvim-telescope/telescope.nvim",
	config = function()
		local worktree = require("git-worktree")
		local telescope = require("telescope")

		worktree.setup()
		telescope.load_extension("git_worktree")

		worktree.on_tree_change(function(op, metadata)
			if op == worktree.Operations.Switch then
				on_switch(metadata)
			end
		end)
	end,
}
