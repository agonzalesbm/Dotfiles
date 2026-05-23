return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      options = {
        multilines = {
          enabled = true,           -- Enable support for multiline diagnostic messages
          always_show = false,      -- Always show messages on all lines of multiline diagnostics
          trim_whitespaces = false, -- Remove leading/trailing whitespace from each line
          tabstop = 4,              -- Number of spaces per tab when expanding tabs
          severity = nil,           -- Filter multiline diagnostics by severity (e.g., { vim.diagnostic.severity.ERROR })
        },
      }
    })

    -- Disable Neovim's default virtual text diagnostics
    vim.diagnostic.config({ virtual_text = false })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
      undercurl = true,
      sp = "#ffc0b9"
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
      undercurl = true,
      sp = "#fce094"
    })
  end,
}
