local builtin = require('telescope.builtin')

-- find files in directory that you opened vim in --
vim.keymap.set('n', '<leader>;f', builtin.find_files, {})

-- find files TRACKED BY GIT in directory that you opened vim in --
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})

-- grep --
vim.keymap.set('n', '<leader>gl', function() builtin.live_grep(); end)
vim.keymap.set('n', '<leader>gs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>gr', builtin.resume, { noremap = true, silent = true, desc = "Resume" })

