-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", ";", ":", { desc = "Open command prompt" })

local hop = require("hop")
local directions = require("hop.hint").HintDirection

map({ "v", "n" }, "fw", function()
  hop.hint_words()
end)
map({ "v", "n" }, "ff", function()
  hop.hint_char1({ directions = directions.AFTER_CURSOR })
end)
map({ "v", "n" }, "fF", function()
  hop.hint_char1({ directions = directions.BEFORE_CURSOR })
end)

map({ "n", "x", "o" }, "h", "h")
map({ "n", "x", "o" }, "n", "j")
map({ "n", "x", "o" }, "e", "k")
map({ "n", "x", "o" }, "i", "l")
map({ "n", "x", "o" }, "m", "i")
map({ "n", "x", "o" }, "M", "I")
map({ "n", "x", "o" }, "l", "e")
map({ "n", "x", "o" }, "L", "E")
map({ "n", "x", "o" }, "j", "b")
map({ "n", "x", "o" }, "J", "B")
map({ "n", "x", "o" }, "k", "n")
map({ "n", "x", "o" }, "K", "N")
map({ "n" }, "ci", "ci")
