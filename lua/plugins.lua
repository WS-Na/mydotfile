local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- ye的插件列表...

    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- OceanicNext
    use("mhartington/oceanic-next")
    -- onedarkpro
    use("olimorris/onedarkpro.nvim")
    -- gruvbox
    use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    -- nightfox
    use ("EdenEast/nightfox.nvim")
    -- github
    use ( "projekt0n/github-nvim-theme" )
    -------------------------------------------------------


    -------------------------- plugins -------------------------------------------
    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- zen mode
    use ( "folke/zen-mode.nvim" )
    -- Toggleterm
    use ( "akinsho/toggleterm.nvim" )
    -------------------------------------------------------


    -------------------  telescope ---------------------------------

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    })
    -- rainbow
    use({"p00f/nvim-ts-rainbow"})
    -- 美化code.action
    use {'nvim-telescope/telescope-ui-select.nvim' }
    -------------------------------------------------------



    -------------------  telescope ---------------------------------
    -- telescope
    use ( { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } } )
    -- telescope extensions
    use ( "LinArcX/telescope-env.nvim" )
    -- Dash app
    use({
      'mrjones2014/dash.nvim',
      run = 'make install',
    })
    -------------------------------------------------------



    -------------------  LSP  ---------------------------------
    -- lspconfig
    use({"neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer"})
    -- jdtls
    use ( "mfussenegger/nvim-jdtls" )
    -----------------------------
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    -- vsnip  luasnip  ultisnips  snippy
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use ("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -----------------------------
    -- ui
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim" )
    -----------------------------
    -- 实用工具
    -- surround
    use("ur4ltz/surround.nvim")
    -------------------------------------------------------

  end,
  config = {
    -- 以浮动窗口打开安装列表
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
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

