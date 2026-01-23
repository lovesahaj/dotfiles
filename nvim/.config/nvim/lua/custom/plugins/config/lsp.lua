-- config for pyright using new vim.lsp.config API
vim.lsp.config('pyright', {
  filetypes = { 'python' },
  settings = {
    pyright = { autoImportCompletion = true },
    python = {
      pythonPath = vim.fn.exepath 'python',
      analysis = { autoSearchPaths = true, diagnosticMode = 'openFilesOnly', useLibraryCodeForTypes = true },
    },
  },
})

vim.lsp.enable('pyright')
