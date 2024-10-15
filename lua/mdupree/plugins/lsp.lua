-- Define dependencies
local lsp_required_dependencies = {
  { "neovim/nvim-lspconfig" },
  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
}

local lsp_optional_dependencies = {
  {
    "williamboman/mason.nvim",
    build = function()
      pcall(function()
        vim.cmd("MasonUpdate")
      end)
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  -- Autocompletion
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lua" },
}

local lsp_dependencies = vim.list_extend(vim.deepcopy(lsp_required_dependencies), lsp_optional_dependencies)

local luasnip_dependencies = {
  "rafamadriz/friendly-snippets",
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
}

local luasnip_opts = {
  history = true,
  delete_check_events = "TextChanged",
}

local luasnip_keys = {
  {
    "<tab>",
    function()
      return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
    end,
    expr = true,
    silent = true,
    mode = "i",
  },
  {
    "<tab>",
    function()
      require("luasnip").jump(1)
    end,
    mode = "s",
  },
  {
    "<s-tab>",
    function()
      require("luasnip").jump(-1)
    end,
    mode = { "i", "s" },
  },
}

local navic_config = function()
  local icons = require("mdupree.icons")
  require("nvim-navic").setup({ icons = icons.kinds })

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
end

local lsp_config = function()
  local lsp = require("lsp-zero")

  vim.opt.signcolumn = "yes"

  -- LSP Setup
  lsp.preset("recommended")
  lsp.format_on_save({
    format_opts = { async = false, timeout_ms = 10000 },
    servers = {
      ["pyright"] = { "python" },
      ["tsserver"] = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
      ["rust_analyzer"] = { "rust" },
    },
  })

  lsp.set_sign_icons({
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»",
  })

  -- Mason setup
  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",

      "ts_ls",
      "rust_analyzer",
      "yamlls",
      "tailwindcss",
      "jsonls",
      "pyright",
    },
    handlers = {
      lua_ls = function()
        local lua_opts = lsp.nvim_lua_ls()
        require("lspconfig").lua_ls.setup(lua_opts)

        require("lspconfig").eslint.setup({
          cmd = { "vscode-eslint-language-server", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
          -- settings = {
          --   -- ESLint settings
          -- },
        })
      end,
      tsserver = function()
        require("lspconfig").tsserver.setup({
          on_attach = function(client, bufnr)
            -- Attach any custom behavior you want for tsserver here
            lsp.default_keymaps({ buffer = bufnr })
            lsp.buffer_autoformat()
          end,
          capabilities = lsp.capabilities,
        })
      end,
      -- Default handler for other servers
      function(server_name)
        lsp.default_setup(server_name)
      end,
      -- function(server_name)
      --   if server_name == "tsserver" then
      --     server_name = "ts_ls"
      --   else
      --     lsp.default_setup(server_name)
      --   end
      -- end,
    },
  })

  -- CMP setup
  local cmp = require("cmp")
  cmp.setup({
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp", max_item_count = 6 },
      { name = "buffer",   max_item_count = 6 },
      { name = "path" },
    },
    formatting = {
      fields = { "menu", "abbr", "kind" },
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
      ["<C-y>"] = cmp.mapping.confirm({ select = false }),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
      ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
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
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "td", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  end)

  lsp.setup()
end

-- Final simplified return
return {
  {
    "VonHeikemen/lsp-zero.nvim",
    version = "v4.x",
    dependencies = lsp_dependencies,
    config = lsp_config,
  },
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows")) and "make install_jsregexp" or nil,
    dependencies = luasnip_dependencies,
    opts = luasnip_opts,
    keys = luasnip_keys,
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = { "neovim/nvim-lspconfig" },
    config = navic_config,
  },
}
