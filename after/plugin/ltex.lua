require('lspconfig').ltex.setup({
  filetypes = {  "tex" },  flags = { debounce_text_changes = 300 },
  settings = {
    ltex = {
      language = "en-CA",
      setenceCacheSize = 2000,
      additionalRules = {
      	enablePickyRules = true,
      	motherTongue = "en-CA",
      },
      trace = { server = "verbose" },
      disabledRules = {},
      hiddenFalsePositives = {},
      username = "x@y.z",
      apiKey = "tete",
    }
  },
  on_attach = on_attach,
})
