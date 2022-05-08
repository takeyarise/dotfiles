local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  -- [[ global plugins ]]
  use "EdenEast/nightfox.nvim" -- color scheme
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require("config.plugin.lualine")
    end,
  }
  use "onsails/lspkind-nvim"
  use {
    "rcarriga/nvim-notify",
    module = "notify",
    setup = function()
      require("config.plugin.notify").setup()
    end,
    config = function()
      require("config.plugin.notify").config()
    end,
  }
  use "windwp/nvim-autopairs"
  -- Lsp関係
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  -- 補完関係
  use {
    "L3MON4D3/LuaSnip",
    requires = {
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      require "config.plugin.luasnip"
    end,
    event = "InsertEnter",
  }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-calc", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
      { "hrsh7th/cmp-emoji", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require "config.plugin.nvim-cmp"
    end,
  }
end)
