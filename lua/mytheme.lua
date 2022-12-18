--
-- Color Scheme
--
function myt()
	vim.opt.termguicolors = true
--vim.g.sonokai_transparent_background = 2
vim.cmd "colorscheme rose-pine"

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

myt()
