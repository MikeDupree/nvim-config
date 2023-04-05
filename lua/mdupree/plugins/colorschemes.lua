return {
  -- Neon
  {
    "rafamadriz/neon",
    config = function()
      local c = require("mdupree.neon.colors")
      local cfg = require("mdupree.neon.config").styles
      vim.g.neon_overrides = {
        iNormal = { fg = c.fg, bg = c.none },  -- normal text and background color
        SignColumn = { fg = c.fg, bg = c.none },
        EndOfBuffer = { fg = c.disabled },     -- ~ lines at the end of a buffer
        NormalFloat = { fg = c.fg, bg = c.bg2 }, -- normal text and background color for floating windows
        FloatBorder = { fg = c.forest_green, bg = c.bg2 },
        ColorColumn = { fg = c.none, bg = c.bg3 }, --  used for the columns set with 'colorcolumn'
        Conceal = { fg = c.gray },             -- placeholder characters substituted for concealed text (see 'conceallevel')
        FoldColumn = { fg = c.blue },
        ToolbarLine = { fg = c.fg, bg = c.bg1 },
        VertSplit = { fg = c.gray_alt },
        Warnings = { fg = c.orange },
        healthError = { fg = c.red },
        healthSuccess = { fg = c.green },
        healthWarning = { fg = c.orange },
        -- My additions
        Directory = { fg = c.yelloww },
        Function = { fg = c.greenn }, -- Not seeing this
        Keyword = { fg = c.bluee },
        Special = { fg = c.redd },
        Identifier = { fg = c.redd },
        graphqlFold = { fg = c.yelloww },
        Statement = { fg = c.redd },
        Structure = { fg = c.bluee },
        Struct = { fg = "#ffc0cb" },
        Todo = { fg = c.yelloww, bg = "#000000" },
        typescriptIdentifierName = { fg = c.fg },
        typescriptBlock = { fg = c.fg },
        typescriptObjectType = { fg = c.fg },
        typescriptMember = { fg = c.fg },
        Label = { fg = c.testing },
        Conditional = { fg = c.testing },
        jsParen = { fg = c.redd },
        Error = { style = "undercurl", sp = "#EC058E"  },
        DiagnosticUnderlineError = { style = "undercurl", sp = c.error },
        DiagnosticUnderlineWarn = { style = "undercurl", sp = c.warning },
        DiagnosticUnderlineInfo = { style = "undercurl", sp = c.info },
        DiagnosticUnderlineHint = { style = "undercurl", sp = c.fg },
        --commo
        Type = { fg = c.cyan },                                              -- int, long, char, etc.
        StorageClass = { fg = c.cyan },                                      -- static, register, volatile, etc.
        Constant = { fg = c.violet },                                        -- any constant
        String = { fg = c.yelloww, bg = c.none },                            -- Any string
        Character = { fg = c.orange },                                       -- any character constant: 'c', '\n'
        Number = { fg = c.red },                                             -- a number constant: 5
        Float = { fg = c.red },                                              -- a floating point constant: 2.3e10
        Operator = { fg = c.forest_green },                                  -- sizeof", "+", "*", etc.
        Exception = { fg = c.blue },                                         -- try, catch, throw
        PreProc = { fg = c.orange },                                         -- generic Preprocessor
        Include = { fg = c.blue },                                           -- preprocessor #include
        Define = { fg = c.cyan },                                            -- preprocessor #define
        Macro = { fg = c.blue },                                             -- same as Define
        Typedef = { fg = c.cyan },                                           -- A typedef
        PreCondit = { fg = c.cyan },                                         -- preprocessor #if, #else, #endif, etc.
        SpecialChar = { fg = c.orange },                                     -- special character in a constant
        Tag = { fg = c.red },                                                -- you can use CTRL-] on this
        Delimiter = { fg = c.yellow },                                       -- character that needs attention like , or .
        SpecialComment = { fg = c.blue },                                    -- special things inside a comment
        Debug = { fg = c.red },                                              -- debugging statements
        Ignore = { fg = c.gray_alt },                                        -- left blank, hidden
        TSComment = { fg = c.gray, bg = c.none, style = cfg.italic_comment }, -- For comment blocks.
        TSConditional = { fg = c.light_blue, style = cfg.italic_keyword },   -- For keywords related to conditionnals.
        TSKeyword = { fg = c.blue, style = cfg.italic_keyword },             -- For keywords that don't fall in previous categories.
        TSAnnotation = { fg = orange },                                      -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSRepeat = { fg = c.blue, style = cfg.italic_keyword },              -- For keywords related to loops.
        TSAttribute = { fg = c.cyan },                                       -- (unstable) TODO: docs
        TSKeywordFunction = { fg = c.blue, style = cfg.italic_keyword },     -- For keywords used to define a fuction.
        TSCharacter = { fg = c.orange },                                     -- For characters.
        TSBoolean = { fg = c.orange, bg = c.none, style = cfg.italic_boolean }, -- true or false
        TSFunction = { fg = c.purple, style = cfg.italic_function .. cfg.bold }, -- For fuction (calls and definitions).
        TSMethod = { fg = c.purple, style = cfg.italic_function },           -- For method calls and definitions.
        TSConstructor = { fg = red },                                        -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSFuncBuiltin = { fg = c.orange, style = cfg.italic_function },      -- For builtin functions: `table.insert` in Lua.
        TSConstant = { fg = c.purple },                                      -- For constants
        TSVariable = { fg = c.light_pink, style = cfg.italic_variable },     -- Any variable name that does not have another highlight.
        TSVariableBuiltin = { fg = c.cyan, style = cfg.italic_variable },    -- Variable names that are defined by the languages, like `this` or `self`.        TSConstBuiltin = {fg = orange}, -- For constant that are built in the language: `nil` in Lua.
        TSConstMacro = { fg = c.cyan },                                      -- For constants that are defined by macros: `NULL` in C.
        TSError = { fg = c.red },                                            -- For syntax/parser errors.
        TSException = { fg = c.blue },                                       -- For exception related keywords.
        TSField = { fg = c.red },                                            -- For fields.
        TSFloat = { fg = c.red },                                            -- For floats.
        TSFuncMacro = { fg = c.orange },                                     -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude = { fg = c.blue },                                         -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel = { fg = c.cyan },                                           -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace = { fg = c.cyan },                                       -- For identifiers referring to modules and namespaces.
        TSNumber = { fg = c.red },                                           -- For all numbers
        TSOperator = { fg = c.blue },                                        -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter = { fg = c.violet },                                     -- For parameters of a function.
        TSParameterReference = { fg = c.fg },                                -- For references to parameters of a function.
        TSProperty = { fg = c.violet },                                      -- Same as `TSField`.
        TSPunctDelimiter = { fg = c.fg },                                    -- For delimiters ie: `.`
        TSPunctBracket = { fg = c.purple },                                  -- For brackets and parens.
        TSPunctSpecial = { fg = c.yellow },                                  -- For special punctutation that does not fall in the catagories before.
        TSString = { fg = c.green },                                         -- For strings.
        TSStringRegex = { fg = c.blue },                                     -- For regexes.
        TSStringEscape = { fg = c.orange },                                  -- For escape characters within a string.
        TSSymbol = { fg = c.orange },                                        -- For identifiers referring to symbols or atoms.
        TSType = { fg = c.orange },                                          -- For types.
        TSTypeBuiltin = { fg = c.cyan },                                     -- For builtin types.
        TSTag = { fg = c.blue },                                             -- Tags like html tag names.
        TSTagDelimiter = { fg = c.blue },                                    -- Tag delimiter like `<` `>` `/`
        TSText = { fg = c.violet },                                          -- For strings considered text in a markup language.
        TSTextReference = { fg = c.orange },                                 -- FIXME
        TSEmphasis = { fg = c.violet },                                      -- For text to be represented with emphasis.
        TSUnderline = { fg = c.fg, bg = c.none, style = "underline" },       -- For text to be represented with an underline.
        TSStrike = {},                                                       -- For strikethrough text.
        TSTitle = { fg = c.fg, bg = c.none, style = "bold" },                -- Text that is part of a title.
        TSLiteral = { fg = c.fg },                                           -- Literal text.
        TSURI = { fg = c.purple },                                           -- Any URL like a link or email.
      }
      local colorscheme = "neon"
      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

      if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not installed!")
        return
      end
      vim.opt.termguicolors = true

      vim.g.neon_style = "dark"
      vim.g.neon_transparent = true
      vim.g.neon_bold = true
      vim.api.nvim_set_hl(0, 'typescriptMember', { fg = "#ffffff", bg = "#333333" })

    end,
  },
  -- Monokai Tasty
  {
    "patstockwell/vim-monokai-tasty",
    config = function()
      vim.g.vim_monokai_tasty_italic = 1               -- allow italics, set this before the colorscheme
      vim.g.vim_monokai_tasty_machine_tint = 1         -- use `mahcine` colour variant
      vim.g.vim_monokai_tasty_highlight_active_window = 1 -- make the active window stand out

      -- local colorscheme = "vim-monokai-tasty"

      -- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      --
      -- if not status_ok then
      -- 	vim.notify("colorscheme " .. colorscheme .. " not installed!")
      -- 	return
      -- end

      vim.opt.termguicolors = true
    end,
  },
  -- vim-monokai-tasty additional packages
  "HerringtonDarkholme/yats.vim",
  --	"pangloss/vim-javascript",
  --	"MaxMEllon/vim-jsx-pretty",
  "styled-components/vim-styled-components",
  "elzr/vim-json",
  "jparise/vim-graphql",
  -- transparency toggle
  "xiyaowong/transparent.nvim",
}
