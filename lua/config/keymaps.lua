-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move to beginning of line in insert mode
vim.keymap.set("i", "<C-a>", "<Esc>^i")
-- Move to end of line in insert mode
vim.keymap.set("i", "<C-e>", "<Esc>$a")
-- Move forward one word in insert mode
vim.keymap.set("i", "<C-w>", "<Esc>ea")
-- Move backward one word in insert mode
vim.keymap.set("i", "<C-b>", "<Esc>bi")
-- Move backward one char in insert mode
vim.keymap.set("i", "<C-h>", "<Esc>i")
-- Select all
vim.keymap.set("n", "<C-q>", "gg0yG")
-- Paste last yanked
vim.keymap.set("n", "<C-c>", '"0p')
-- Set <Leader>p to select all and paste
vim.keymap.set("n", "<leader>a", "ggVGp", { desc = "Select all and paste" })
-- Copy path with F keys
vim.keymap.set("n", "<F1>", function()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg(vim.v.register, filename)
  vim.notify("Copied filename: " .. filename, vim.log.levels.INFO)
end, { desc = "Copy filename to clipboard" })

vim.keymap.set("n", "<F2>", function()
  local filepath = vim.fn.expand("%:p:h")
  vim.fn.setreg(vim.v.register, filepath)
  vim.notify("Copied path: " .. filepath, vim.log.levels.INFO)
end, { desc = "Copy path to clipboard" })

vim.keymap.set("n", "<F3>", function()
  local filepath = vim.fn.expand("%:p")
  vim.fn.setreg(vim.v.register, filepath)
  vim.notify("Copied to clipboard: " .. filepath, vim.log.levels.INFO)
end, { desc = "Copy filename+line to clipboard" })

vim.keymap.set("n", "<leader>bR", function()
  local state = require("bufferline.state")
  local groups = require("bufferline.groups")
  local ui = require("bufferline.ui")
  -- Get current buffer
  local current_buf_id = vim.api.nvim_get_current_buf()
  local current_element = nil
  -- Collect all pinned buffers first
  local pinned_buffers = {}
  for _, item in ipairs(state.components) do
    local element = item:as_element()
    if element then
      -- Save current element reference
      if element.id == current_buf_id then
        current_element = element
      end
      -- Add all pinned buffers except current to the list for unpinning
      if groups._is_pinned(element) and element.id ~= current_buf_id then
        table.insert(pinned_buffers, element)
      end
    end
  end
  -- Remove all buffers from the pinned group (except current)
  for _, element in ipairs(pinned_buffers) do
    groups.remove_element("pinned", element)
  end
  -- Ensure current buffer is pinned
  if current_element then
    -- Only pin if not already pinned
    if not groups._is_pinned(current_element) then
      groups.add_element("pinned", current_element)
    end
  end
  -- Refresh the bufferline display
  ui.refresh()
  vim.notify("All buffers unpinned except current", vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = "Unpin all buffers except current" })
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
vim.keymap.set("n", "<leader>cu", function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.organizeImports" },
      diagnostics = {},
    },
  })
end, { desc = "Organize imports" })
