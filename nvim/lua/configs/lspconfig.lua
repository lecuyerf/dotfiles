require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "groovyls", "kotlin_lsp" }
vim.lsp.enable(servers)

-- Configure Kotlin LSP to run Java in headless mode to avoid AWT/Swing warnings
vim.lsp.config("kotlin_lsp", {
  cmd_env = {
    JAVA_TOOL_OPTIONS = "-Djava.awt.headless=true",
  },
})

-- Roslyn LSP
vim.lsp.config("roslyn", {})
