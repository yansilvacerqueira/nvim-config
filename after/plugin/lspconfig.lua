local lspconfig = require 'lspconfig'
local servers = require 'yan.servers'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in ipairs(servers) do
  if server == 'lua_ls' then
    lspconfig[server].setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })
  else
    lspconfig[server].setup({
      capabilities = capabilities
    })
  end
end


