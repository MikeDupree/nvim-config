local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "lsp-config.mason"
require("lsp-config.handlers").setup()
require "lsp-config.null-ls"

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
}
)

require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = {
    -- Needed for inlayHints. Merge this table with your settings or copy
    -- it from the source if you want to add your own init_options.
    init_options = require("nvim-lsp-ts-utils").init_options,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    on_attach = function(client, bufnr)
      local ts_utils = require("nvim-lsp-ts-utils")
      require("lsp-config.handlers").on_attach(client, bufnr)

      -- format on save
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
      end

      -- defaults
      ts_utils.setup({
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,

        -- import all
        import_all_timeout = 5000, -- ms
        -- lower numbers = higher priority
        import_all_priorities = {
          same_file = 1, -- add to existing import statement
          local_files = 2, -- git files or files with relative path markers
          buffer_content = 3, -- loaded buffer content
          buffers = 4, -- loaded buffer names
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,
        -- if false will avoid organizing imports
        always_organize_imports = true,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {},

        -- inlay hints
        auto_inlay_hints = true,
        inlay_hints_highlight = "Comment",
        inlay_hints_priority = 200, -- priority of the hint extmarks
        inlay_hints_throttle = 150, -- throttle the inlay hint request
        inlay_hints_format = { -- format options for individual hint kind
          Type = {},
          Parameter = {},
          Enum = {},
        },

        -- update imports on file move
        update_imports_on_move = true,
        require_confirmation_on_move = false,
        watch_dir = nil,
      })

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- no default maps, so you may want to define some here
      local opts = { silent = true }
      --vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
      --vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
      --vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end,
  }
})

require("formatter").setup(
  {
    logging = true,
    filetype = {
      typescriptreact = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      typescript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
        -- linter
        -- function()
        --   return {
        --     exe = "eslint",
        --     args = {
        --       "--stdin-filename",
        --       vim.api.nvim_buf_get_name(0),
        --       "--fix",
        --       "--cache"
        --     },
        --     stdin = false
        --   }
        -- end
      },
      javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      javascriptreact = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      json = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

