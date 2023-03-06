require "config"

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]])
