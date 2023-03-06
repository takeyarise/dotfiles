local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    return true
  end
  return false
end

local packer_boostrap = ensure_packer()

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
  use "onsails/lspkind-nvim" -- icon display during completion
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
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_boostrap then
    require('packer').sync()
  end
end)
