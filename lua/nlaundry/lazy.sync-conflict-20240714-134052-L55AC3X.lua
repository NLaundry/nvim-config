-- SET LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    "tpope/vim-surround",
    "tpope/vim-repeat",
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.2',
        requires = { "nvim-lua/plenary.nvim" }
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    -- {
    --     'stevearc/oil.nvim',
    --     opts = {},
    --     -- Optional dependencies
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    -- },

    { "nvim-treesitter/nvim-treesitter",  run = ':TSUpdate' },
    "nvim-treesitter/playground",
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/harpoon",
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },

    -- LSP Support

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    'mfussenegger/nvim-lint',
    { 'mhartington/formatter.nvim' },
    "princejoogie/mason-formatter.nvim",
    "rshkarin/mason-nvim-lint",

    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    {
        'neovim/nvim-lspconfig',
        -- opts = {
        --     inlay_hints = { enabled = true },
        -- }
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "jalvesaq/zotcite",
    "jalvesaq/cmp-zotcite",

    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    "saadparwaiz1/cmp_luasnip",
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'cmp'.setup {
                snippet = {
                    expand = function(args)
                        require 'luasnip'.lsp_expand(args.body)
                    end
                },

                sources = {
                    { name = 'luasnip' },
                    -- more sources
                },
            }
        end

    },
    { 'saadparwaiz1/cmp_luasnip' },
    "folke/which-key.nvim",
    "romgrk/fzy-lua-native",
    "gelguy/wilder.nvim",
    -- "folke/noice.nvim",
    "nvim-lualine/lualine.nvim",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    "preservim/vim-pencil",
    "folke/trouble.nvim",
    "chrisgrieser/nvim-early-retirement",
    {
        'lukas-reineke/headlines.nvim',
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {}
    },
    -- {
    --     'jakewvincent/mkdnflow.nvim',
    --     rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    --     config = function()
    --         require('mkdnflow').setup()
    --     end
    -- },
    -- Lua
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    -- packer.nvim
    -- {
    --     "robitx/gp.nvim",
    --     config = function()
    --         require("gp").setup()
    --
    --         -- or setup with your own config (see Install > Configuration in Readme)
    --         -- require("gp").setup(conf)
    --
    --         -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    --     end,
    -- },
    -- {
    --     "LhKipp/nvim-nu",
    --     config = function()
    --         require 'nu'.setup {}
    --     end
    -- },
    -- {
    --     "epwalsh/obsidian.nvim",
    --     version = "*", -- recommended, use latest release instead of latest commit
    --     lazy = true,
    --     ft = "markdown",
    --     -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    --     -- event = {
    --     --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --     --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --     --   "BufReadPre path/to/my-vault/**.md",
    --     --   "BufNewFile path/to/my-vault/**.md",
    --     -- },
    --     dependencies = {
    --         -- Required.
    --         "nvim-lua/plenary.nvim",
    --
    --         -- see below for full list of optional dependencies 👇
    --     },
    -- },
    -- {
    --     'Lilja/zellij.nvim',
    --     config = function()
    --         require('zellij').setup({
    --             -- keys with designated default values.
    --             path = "zellij",                            -- Zellij binary path
    --             replaceVimWindowNavigationKeybinds = false, -- Will set keybinds like <C-w>h to left
    --             vimTmuxNavigatorKeybinds = false,           -- Will set keybinds like <C-h> to left
    --             debug = false,                              -- Will log things to /tmp/zellij.nvim
    --         })
    --     end
    -- },
    'lepture/vim-jinja',
    'github/copilot.vim',
    'sakhnik/nvim-gdb',
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/DigitalBrain/DigitalBrain',
                    syntax = 'markdown',
                    ext = '.md',
                    filetypes = "markdown"
                },
            }
        end,
    },
    -- 'tools-life/taskwiki',
    'jasonccox/vim-wayland-clipboard',
    'jremmen/vim-ripgrep',
    'dhruvasagar/vim-table-mode',
    -- Lua
    {
        "folke/twilight.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }

})
