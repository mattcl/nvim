require("gitsigns").setup()
local gps = require("nvim-gps")
gps.setup {
  icons = {
    ["class-name"] = " ",
    ["function-name"] = " ",
    ["method-name"] = " ",
  }
}

require("lualine").setup {
  options = {
    theme = "nightfox"
  },
  sections = {
    lualine_c = {
      'filename',
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      {'diagnostics', sources = {"coc"}},
      'encoding',
      'fileformat',
      'filetype'
    },
  }
}
