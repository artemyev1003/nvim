vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.autochdir = true

-- File handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true -- Persistent undo
vim.opt.autoread = true -- Auto reload files changed outside vim

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true -- Show matches as you type
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case insensitive if uppercase search


vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.clipboard:append("unnamedplus")

vim.g.python3_host_prog = '~/.pyenv/versions/neovim/bin/python'


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch', -- The color group used for the flash
      timeout = 150,         -- How long the highlight lasts (in ms)
    })
  end,
})

