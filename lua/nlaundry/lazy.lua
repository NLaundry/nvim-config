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
vim.o.termguicolors = true

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
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
        },
    },
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
            -- vim.cmd([[colorscheme tokyonight]])
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },

    -- LSP Support

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        "stevearc/conform.nvim",
        "LittleEndianRoot/mason-conform",
    },
    
    'mfussenegger/nvim-lint',
    -- { 'mhartington/formatter.nvim' },
    -- "princejoogie/mason-formatter.nvim",
    "rshkarin/mason-nvim-lint",

    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    {
        'neovim/nvim-lspconfig',
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    -- "jalvesaq/zotcite",
    -- "jalvesaq/cmp-zotcite",

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
    -- "windwp/nvim-ts-autotag",
    "preservim/vim-pencil",
    "chrisgrieser/nvim-early-retirement",
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
    -- {
    --     "MeanderingProgrammer/render-markdown.nvim",
    --     ---@module 'render-markdown'
    --     ---@type render.md.UserConfig
    --     opts = {}
    -- },
    {
        "folke/zen-mode.nvim",
        opts = {
        }
    },
    'github/copilot.vim',
    'sakhnik/nvim-gdb',
    'jremmen/vim-ripgrep',
    'dhruvasagar/vim-table-mode',
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
    },
    {
        "folke/twilight.nvim",
        opts = {
        }
    }

})
