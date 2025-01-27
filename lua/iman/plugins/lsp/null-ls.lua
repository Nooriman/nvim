local setup, null_ls = pcall(require, "null-ls")
if not setup then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Create an augroup for managing format-on-save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- Add Prettier for formatting
        formatting.prettier.with({
            filetypes = { "javascript", "typescript", "html", "css", "json" },
        }),
        -- Add Stylua for Lua formatting
        formatting.stylua,
        -- Add ESLint diagnostics
        diagnostics.eslint_d.with({
            filetypes = { "javascript", "typescript" },
        }),
    },
on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
        -- Debugging: Print client name
        print("Formatting enabled for client: " .. current_client.name)

        -- Clear any existing autocmds for the buffer
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

        -- Create a new autocmd for format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({
                    filter = function(client)
                        -- Debugging: Check which client is being used for formatting
                        print("Formatting with client: " .. client.name)
                        -- Only use null-ls for formatting
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end,
        })
    else
        -- Debugging: Indicate if formatting is not supported
        print("Client does not support formatting: " .. current_client.name)
    end
end
})
