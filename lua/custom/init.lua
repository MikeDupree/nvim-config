---fEnable the custom modules you want here
local custom = {
  require 'custom.plugins.mini',
  require 'custom.plugins.diagnostics',
  --require 'custom.plugins.mini',
  require 'custom.plugins.harpoon',
  require 'custom.plugins.cursor_word_highlight',
  require 'custom.plugins.refactoring',
  require 'custom.plugins.terminal',
  require 'custom.plugins.status_line',
  require 'custom.plugins.markdown_preview',
}

return custom
