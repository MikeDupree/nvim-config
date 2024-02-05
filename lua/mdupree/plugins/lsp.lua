return {
  {
    "VonHeikemen/lsp-zero.nvim",
    version = "v3.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {                            -- Optional
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },                  -- Required
      { "hrsh7th/cmp-nvim-lsp" },              -- Required
      { "hrsh7th/cmp-buffer" },                -- Optional
      { "hrsh7th/cmp-path" },                  -- Optional
      { "saadparwaiz1/cmp_luasnip" },          -- Optional
      { "hrsh7th/cmp-nvim-lua" },              -- Optional
      -- Signature Help
      { "folke/neodev.nvim", opts = {} },       -- Optional
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
      { 'quangnguyen30192/cmp-nvim-ultisnips' },
    },
    config = function()
      --
      -- config
      --
      local lsp = require("lsp-zero")
      vim.opt.signcolumn = "yes"
      lsp.preset("recommended")
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        lsp.buffer_autoformat()
      end)

      -- NOTE: Not sure if i need this with ^ buffer_autoformat
      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['tsserver'] = { 'javascript', 'typescript' },
          ['rust_analyzer'] = { 'rust' },
        }
      })

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      --
      -- MASON Configuration
      --
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'tsserver', 'eslint', 'rust_analyzer', 'yamlls', 'tailwindcss', 'jsonls' },
        handlers = {
          lsp.default_setup,
          lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      })


      --
      -- CMP Configuration
      --
      local cmp = require("cmp")
      local cmp_format = require('lsp-zero').cmp_format()
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'ultisnips' },
          { name = 'buffer' },
        },
        --- (Optional) Show source name in completion menu
        --formatting = cmp_format,
        formatting = {
          -- changing the order of fields so the icon is the first
          fields = { 'menu', 'abbr', 'kind' },

          -- here is where the change happens
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = '🛠',
              luasnip = '🔨',
              buffer = '🗄',
              path = '🖫',
              nvim_lua = 'Π',
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        mapping = {
          ['<C-y>'] = cmp.mapping.confirm({ select = false }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
          ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = 'insert' })
            else
              cmp.complete()
            end
          end),
          ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = 'insert' })
            else
              cmp.complete()
            end
          end),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
      end)

      lsp.setup()
    end,
  },
}
