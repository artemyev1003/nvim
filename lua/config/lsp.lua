vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('html')

local keymap = vim.keymap

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    if client and client.name == 'jdtls' then
      vim.keymap.set('n', '<leader>co', function()
        vim.lsp.buf.code_action({
          context = { only = { 'source.organizeImports' } },
          apply = true,
        })
      end, { buffer = ev.buf, desc = "Java: Organize Imports" })
  end
    -- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
    --   vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
    --   vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    --   vim.keymap.set('i', '<C-a>', function()
    --     vim.lsp.completion.get()
    --   end)
    -- end
  end,
})



-- Diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true
  --
  --

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})


-- java settings
vim.lsp.config('jdtls', {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = "/Users/egor/Library/Java/JavaVirtualMachines/openjdk-25.0.1/Contents/Home",
            default = true,
          }
        }
      }
    }
  }
})

-- lua settings
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
              "vim"
        }
      }
    }
  }
})

