require "nvchad.autocmds"

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.api.nvim_set_hl(0, "Cursor", {})
  end,
})
