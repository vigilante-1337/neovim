-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Create an autocommand group for transparency
local transparent_group = vim.api.nvim_create_augroup("TransparentBg", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = transparent_group,
  pattern = "*",
  callback = function()
    -- Force main editor background to be transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "#abb2bf" })

    -- Optional: Fix Neo-tree backgrounds to match your new transparent layout
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
  end,
})

local transparent_group = vim.api.nvim_create_augroup("TransparentBg", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = transparent_group,
  pattern = "*",
  callback = function()
    -- 1. Base Editor Windows (Forces everything to match your transparency preference)
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", fg = "#abb2bf" })

    -- 2. Floating Windows & Borders
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

    -- 3. Kill Neo-tree Focus Highlights (Links internal groups directly to Normal)
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })

    -- 4. Clean up any leftover side panel border highlights
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.lazy")

local transparent_group = vim.api.nvim_create_augroup("TransparentBg", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = transparent_group,
  pattern = "*",
  callback = function()
    -- Base editor windows
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", fg = "#abb2bf" })

    -- Floating windows and borders
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

    -- Neo-tree
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
  end,
})
