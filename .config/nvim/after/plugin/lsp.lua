local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
  'lua_ls',
  'basedpyright',
  'gopls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('basedpyright', {
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic"
            }
        }
    }
})

lsp.configure('gopls', {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true
            },
            staticcheck = true
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- Disable tab and shift-tab for Github Copilot support
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

--- linting / formatting ---

require("lint").linters_by_ft = {
  --python = { "ruff", "dmypy" }
  python = { "ruff" }
}

vim.api.nvim_create_augroup("AutoLint", {})
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        group = "AutoLint",
        callback = function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          require("lint").try_lint()
        end,
    }
)

vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.py",
        group = "AutoFormat",
        callback = function()
            -- Save the current cursor position
            local pos = vim.api.nvim_win_get_cursor(0)

            local filepath = vim.fn.expand("%:p")
            local before = vim.fn.getftime(filepath)
            vim.fn.system({ "black", "--quiet", filepath })
            local after = vim.fn.getftime(filepath)
            if after ~= before then
                vim.cmd("edit")
                vim.api.nvim_win_set_cursor(0, pos)
            end
        end,
    }
)
