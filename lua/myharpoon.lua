local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local keymap = vim.keymap.set
local opts = { noremap = true }

keymap("n", "<leader>a", mark.add_file)
keymap("n", "<leader>he", ui.toggle_quick_menu)
keymap("n", "<leader>1", function() ui.nav_file(1) end)
keymap("n", "<leader>2", function() ui.nav_file(2) end)
keymap("n", "<leader>3", function() ui.nav_file(3) end)
keymap("n", "<leader>4", function() ui.nav_file(4) end)
