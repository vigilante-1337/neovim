-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "x" }, "j", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map("o", "j", "k", { desc = "Up" })
map("o", "k", "j", { desc = "Down" })

map("n", "<C-j>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-k>", "<C-w>j", { desc = "Go to Lower Window" })
