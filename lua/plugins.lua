local packer = require('packer')
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use('wbthomason/packer.nvim')
        -- ye的插件列表...

        --------------------- colorschemes --------------------
        -- tokyonight
        use('folke/tokyonight.nvim')
        -- OceanicNext
        use('mhartington/oceanic-next')
        -- onedarkpro
        use('olimorris/onedarkpro.nvim')
        -- gruvbox
        use({ 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } })
        -- nightfox
        use('EdenEast/nightfox.nvim')
        -- github
        use('projekt0n/github-nvim-theme')
        -- catppuccin
        use({
            'catppuccin/nvim',
            as = 'catppuccin',
        })
        -------------------------------------------------------

        -------------------------- plugins -------------------------------------------
        -- nvim-tree
        use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
        -- bufferline
        --use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
        use({ 'akinsho/bufferline.nvim', tag = '*', requires = 'kyazdani42/nvim-web-devicons' })
        -- lualine
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('arkav/lualine-lsp-progress')
        -- dashboard-nvim
        use('glepnir/dashboard-nvim')
        -- project
        use('ahmedkhalf/project.nvim')
        -- zen mode
        use('folke/zen-mode.nvim')
        -- Toggleterm
        use({ 'akinsho/toggleterm.nvim' })
        -- easymotion(hop)
        use({ 'phaazon/hop.nvim', branch = 'v1' })
        -- git
        use({ 'lewis6991/gitsigns.nvim' })
        --git_diff_view
        use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })
        -- autopairs
        use('windwp/nvim-autopairs')
        -- fold
        use({ 'anuvyklack/pretty-fold.nvim', branch = 'nightly' })
        -------------------------------------------------------

        -------------------  treesitter ------------------------

        -- treesitter
        use({
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
        })
        -- rainbow
        use({ 'p00f/nvim-ts-rainbow' })
        -------------------------------------------------------

        -------------------  telescope ---------------------------------
        -- telescope
        use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
        -- telescope extensions
        use('LinArcX/telescope-env.nvim')
        -- Dash app
        -- fzf in telescope
        use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
        -- ui -section
        use({ 'nvim-telescope/telescope-ui-select.nvim' })
        -- brower bookmarks
        use({
            'dhruvmanila/telescope-bookmarks.nvim',
            -- Uncomment if the selected browser is Firefox
            -- requires = {
            --   'tami5/sqlite.lua',
            -- }
        })
        -- clipboard manager
        use({
            'AckslD/nvim-neoclip.lua',
        })
        -------------------------------------------------------

        -------------------  LSP  ---------------------------------
        -- lspconfig
        use({ 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer' })
        -- jdtls
        use('mfussenegger/nvim-jdtls')
        -- 为neovim带来intellij的快速修复和linting,自动完成
        use('Shougo/deoplete.nvim')
        -- JSON 增强
        use('b0o/schemastore.nvim')
        -----------------------------
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- snippet 引擎
        -- vsnip  luasnip  ultisnips  snippy
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -----------------------------
        -- debug
        use('mfussenegger/nvim-dap')
        -- debug ui
        use('theHamsta/nvim-dap-virtual-text')
        -- ui
        use('onsails/lspkind-nvim')
        use('tami5/lspsaga.nvim')
        -- indent-blankline
        use('lukas-reineke/indent-blankline.nvim')
        -- 代码格式化
        use('mhartington/formatter.nvim')
        -- null-ls
        use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
        -- 项目结构
        use({ 'simrat39/symbols-outline.nvim' })
        -----------------------------
        -- 实用工具
        -- surround
        use('ur4ltz/surround.nvim')
        use({ 'folke/todo-comments.nvim' })
        -- highlight cursorline
        use({ 'yamatsum/nvim-cursorline' })
        -------------------------------------------------------
    end,
    config = {
        -- 以浮动窗口打开安装列表
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
       augroup packer_user_config
       autocmd!
       autocmd BufWritePost plugins.lua source <afile> | PackerSync
       augroup end
     ]]
)
