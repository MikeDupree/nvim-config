return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local excluded_filetypes = {
      "harpoon",
      "neo-tree",
      "qf",
      "TelescopePrompt",
      "Trouble",
    }
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        excluded_filetypes = excluded_filetypes,
      },
    })
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    -- Wrap mark functions to prevent attempting to add files of certain types
    local safe_mark = function(add_func)
      return function()
        local ft = vim.bo.filetype
        if not vim.tbl_contains(excluded_filetypes, ft) then
          return add_func()
        end
        vim.notify("Cannot add file of type " .. ft, vim.log.levels.ERROR)
      end
    end

    vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon: quick menu" })
    vim.keymap.set("n", "<leader>ha", safe_mark(mark.add_file), { desc = "Harpoon: add file" })
    vim.keymap.set("n", "<leader>hr", mark.rm_file, { desc = "Harpoon: remove file" })
    vim.keymap.set("n", "<leader>hx", mark.clear_all, { desc = "Harpoon: clear all" })

    -- Set keymaps for pinning and going to the first five marks
    local set_mark_at = function (num)
      return function() safe_mark(mark.set_current_at(num)) end
    end

    local goto = function (num)
      return function() ui.nav_file(num) end
    end

    for i = 1, 5 do
      local lhs = string.format("<leader>%s", i)
      local desc = string.format("Harpoon: Goto %s", i)
      vim.keymap.set("n",  lhs, goto(i), { desc = desc })
      lhs = string.format("<leader>h%s", i)
      desc = string.format("Harpoon: mark at %s", i)
      vim.keymap.set("n",  lhs, set_mark_at(i), { desc = desc })
    end
  end,
}
