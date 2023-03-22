--
-- Color Scheme
--
vim.opt.termguicolors = true
--vim.g.sonokai_transparent_background = 2
vim.cmd "colorscheme rose-pine"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

-- aurora
--vim.api.nvim_set_hl(0, '@string', { fg = '#FFC95D' })
--vim.api.nvim_set_hl(0, '@field', { fg = '#f93393' })
--vim.api.nvim_set_hl(0, '@number', { fg = '#A7F542' })
--vim.g.aurora_transparent = 1
--vim.g.aurora_bold = 1
--vim.g.aurora_darker = 1
