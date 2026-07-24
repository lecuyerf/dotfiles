require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25,r-cr:hor20,o:hor50"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    if vim.fn.expand("%:p"):find("Obsidian/Vault", 1, true) then
      vim.opt_local.conceallevel = 2
    end
  end,
})
