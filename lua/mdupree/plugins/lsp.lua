return {
  {
    "VonHeikemen/lsp-zero.nvim",
    version = "v3.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {                         -- Optional
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },               -- Required
      { "hrsh7th/cmp-nvim-lsp" },           -- Required
      { "hrsh7th/cmp-buffer" },             -- Optional
      { "hrsh7th/cmp-path" },               -- Optional
      { "hrsh7th/cmp-nvim-lua" },           -- Optional
      --{ "saadparwaiz1/cmp_luasnip" },       -- Optional
      -- Signature Help
      --{ "folke/neodev.nvim",                opts = {} }, -- Optional
      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        build = (not jit.os:find("Windows"))
            and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
            or nil,
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
          {
            "nvim-cmp",
            dependencies = {
              "saadparwaiz1/cmp_luasnip",
            },
            opts = function(_, opts)
              opts.snippet = {
                expand = function(args)
                  require("luasnip").lsp_expand(args.body)
                end,
              }
            end,
          },
        },
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
        -- stylua: ignore
        keys = {
          {
            "<tab>",
            function()
              return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true,
            silent = true,
            mode = "i",
          },
          { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
          { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
        },
      },
      config = function()
        require("luasnip").filetype_extend("javascript", { "javascriptreact" })
        require("luasnip").filetype_extend("javascript", { "html" })
      end,
      {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
          local icons = require("mdupree.icons")
          require("nvim-navic").setup({
            icons = icons.kinds,
          })

          vim.api.nvim_create_augroup("LspAttach_navic", {})
          vim.api.nvim_create_autocmd("LspAttach", {
            group = "LspAttach_navic",
            callback = function(args)
              if not (args.data and args.data.client_id) then
                return
              end

              local bufnr = args.buf
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, bufnr)
              end
            end,
          })
        end,
      },
    },
    config = function()
      --
      -- config
      --
      local lsp = require("lsp-zero")
      local navic = require("nvim-navic")

      vim.opt.signcolumn = "yes"
      local function status_line()
        local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
        local file_name = "%-.16t"
        local buf_nr = "[%n]"
        local modified = " %-m"
        local file_type = " %y"
        local right_align = "%="
        local line_no = "%10([%l/%L%)]"
        local pct_thru_file = "%5p%%"

        return string.format(
          "%s%s%s%s%s%s%s",
          file_name,
          buf_nr,
          modified,
          file_type,
          right_align,
          line_no,
          pct_thru_file
        )
      end

      -- vim.opt.statusline = status_line()
      -- vim.opt.winbar = status_line()

      lsp.preset("recommended")

      -- NOTE: Not sure if i need this with ^ buffer_autoformat
      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ["pyright"] = { "python" },
          ["tsserver"] = { "javascript", "typescript" },
          ["rust_analyzer"] = { "rust" },
        },
      })

      lsp.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })

      --
      -- MASON Configuration
      --
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "rust_analyzer",
          "yamlls",
          "tailwindcss",
          "jsonls",
          "pyright",
        },
        handlers = {
          lsp.default_setup,
          lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
        },
      })

      --
      -- CMP Configuration
      --
      local cmp = require("cmp")
      local cmp_format = require("lsp-zero").cmp_format()
      cmp.setup({
        sources = {
          -- Uncomment for copilot to show in completion menu
          -- Personally i don't like it
          --{ name = "copilot" },
          { name = "luasnip" },
          { name = "nvim_lsp", max_item_count = 6 },
          { name = "buffer",   max_item_count = 6 },
          { name = "path" },
        },
        --- (Optional) Show source name in completion menu
        --formatting = cmp_format,
        formatting = {
          -- changing the order of fields so the icon is the first
          fields = { "menu", "abbr", "kind" },

          -- here is where the change happens
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = "🛠",
              luasnip = "🔨",
              buffer = "🗄",
              path = "🖫",
              nvim_lua = "Π",
              copilot = "🚀",
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        mapping = {
          --Copilot Section
          -- This is neceaary for copilot to work with cmp
          -- https://lsp-zero.netlify.app/v3.x/guide/setup-copilot-lua-plus-nvim-cmp.html
          --["<CR>"] = cmp.mapping.confirm({
          -- documentation says this is important.
          -- I don't know why.
          --behavior = cmp.ConfirmBehavior.Replace,
          --select = false,
          --}),
          --END Copilot Section
          ["<C-y>"] = cmp.mapping.confirm({ select = false }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
          ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
          ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = "insert" })
            else
              cmp.complete()
            end
          end),
          ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = "insert" })
            else
              cmp.complete()
            end
          end),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        lsp.buffer_autoformat()

        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>vca", function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
      end)

      lsp.setup()
    end,
  },
}
