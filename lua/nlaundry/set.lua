vim.opt.guicursor = ""

vim.cmd('set nofixendofline')
vim.cmd('set nofixeol')
vim.cmd('set noendofline')

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.o.termguicolors = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50


-- size of a hard tabstop
vim.cmd('set tabstop=4')


-- always uses spaces instead of tab characters
vim.cmd('set expandtab')

-- size of an "indent"
vim.cmd('set shiftwidth=4')

vim.cmd('set clipboard=unnamedplus')

vim.cmd('set wildignorecase')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')
vim.cmd('set guifont=Jetbrains\\ Mono:h16')



vim.filetype.add({
  extension = {
    mdx = 'mdx'
  }
})


vim.cmd('au BufEnter *.md :SoftPencil')
vim.cmd('au BufEnter *.md :set suffixesadd+=.md')
vim.cmd('au BufEnter *.md :set conceallevel=1')
vim.cmd('set path+=.,/usr/include,/usr/local/include,~/DigitalBrain/DigitalBrain,~/Documents/projects')


vim.cmd [[
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
]]

local function make_session(overwrite)
  local sessiondir = vim.fn.getenv("HOME") .. "/.vim/sessions" .. vim.fn.getcwd()
  if vim.fn.filewritable(sessiondir) ~= 2 then
    vim.fn.mkdir(sessiondir, "p")
    vim.cmd("redraw!")
  end
  local filename = sessiondir .. '/session.vim'
  if overwrite == 0 and vim.fn.empty(vim.fn.glob(filename)) == 0 then
    return
  end
  vim.cmd("mksession! " .. filename)
end

local function load_session()
  local sessiondir = vim.fn.getenv("HOME") .. "/.vim/sessions" .. vim.fn.getcwd()
  local sessionfile = sessiondir .. "/session.vim"
  if vim.fn.filereadable(sessionfile) ~= 0 then
    vim.cmd('source ' .. sessionfile)
  else
    print("No session loaded.")
  end
end

if vim.fn.argc() == 0 then
  vim.api.nvim_create_autocmd("VimEnter", { nested = true, callback = load_session })
  vim.api.nvim_create_autocmd("VimLeave", { callback = function() make_session(1) end })
else
  vim.api.nvim_create_autocmd("VimLeave", { callback = function() make_session(0) end })
end





local function journal_today()
  -- Disable cmp for the current buffer
  vim.cmd('ObsidianToday')
  -- Activate ZenMode
  vim.cmd('ZenMode')
  require('cmp').setup.buffer { enabled = false }
end
vim.api.nvim_create_user_command('Journal', journal_today, {})


local function zen()
  -- Disable cmp for the current buffer
  require('cmp').setup.buffer { enabled = false }
  -- Activate ZenMode
  vim.cmd('ZenMode')
end

vim.api.nvim_create_user_command('Zen', zen, {})




vim.api.nvim_create_user_command('APICall', 
    function(opts)
        vim.cmd('new')
        vim.fn.termopen(opts.args .. ' | jq')
        vim.cmd('wincmd p')
        vim.cmd('set filetype=json')
    end
, {nargs = 1})

vim.api.nvim_create_user_command('CmpOff', 
    function()
        require('cmp').setup.buffer { enabled = false }
    end
, {})
vim.api.nvim_create_user_command('CmpOn', 
    function()
        require('cmp').setup.buffer { enabled = true }
    end
, {})

vim.api.nvim_create_user_command('JournalPrompt', 
    function()
        vim.cmd('r! sgpt --role="Philosopher" --model="gpt-4" --temperature=1.5 --top-probability=0.6 --no-cache "Give me a philosophical journaling prompt to help me improve my clarity of thought through, mental health, or some other aspect of my life. You may draw from Stoicism, Socratic thought, neo-platonism, Zen, or even from modern psychology such as Mindful CBT, etc. that includes an explanation of the origin, quote, and helpful tips on how to reflect. Provide the output in nicely formatted markdown with headers. The first block should be Philosophical Journal Prompt with the subheadings quote, origin, reflection tip. With regards to origin provide context for this specific quote not just a background of the school of philosophy."')
    end
, {})

-- vim.api.nvim_create_user_command('Upper',
--   function(opts)
--     print(string.upper(opts.fargs[1]))
--   end,
--   { nargs = 1 })
-- vim.cmd('command! -nargs=1 APICall call APICall(<f-args>)')
