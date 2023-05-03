require("gitsigns").setup()

require('aerial').setup({
    backends = { "treesitter" },
})

require("lualine").setup {
  options = {
    theme = "nightfox"
  },
  sections = {
    lualine_c = {
      'filename',
      'aerial',
    },
    lualine_x = {
      {'diagnostics', sources = {"coc"}},
      'encoding',
      'fileformat',
      'filetype'
    },
  },
}
