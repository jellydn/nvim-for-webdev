-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Press jj,jk fast to enter
keymap("i", "jj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)

-- Close buffers
if Util.has("mini.bufremove") then
  keymap("n", "<S-q>", function()
    require("mini.bufremove").delete(0, false)
    local bufs = vim.fn.getbufinfo({ buflisted = true })
    -- open alpha if no buffers are left
    if not bufs[2] and Util.has("alpha-nvim") then
      require("alpha").start(true)
    end
  end, opts)
else
  keymap("n", "<S-q>", "<cmd>bd<CR>", opts)
end

-- Dashboard
-- Add keymap to open alpha dashboard
keymap("n", "<leader>;", function()
  -- close all open buffers before open dashboard
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
    if buftype ~= "terminal" then
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
  end

  if Util.has("alpha-nvim") then
    require("alpha").start(true)
  end
end, opts)

-- NullLs Info keymap
if Util.has("none-ls.nvim") then
  keymap("n", "<leader>cn", "<cmd>NullLsInfo<CR>", opts)
end

-- Better paste
-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
keymap("v", "p", '"_dP', opts)

-- Copy whole file content to clipboard with C-c
keymap("n", "<C-c>", ":%y+<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move live up or down
-- moving
keymap("n", "<A-Down>", ":m .+1<CR>", opts)
keymap("n", "<A-Up>", ":m .-2<CR>", opts)
keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- Show Lsp info
keymap("n", "<leader>cl", "<cmd>LspInfo<CR>", opts)

-- Show references on telescope
if Util.has("telescope.nvim") then
  keymap("n", "gr", "<cmd>Telescope lsp_references<CR>")
end

-- LspSaga
if Util.has("lspsaga.nvim") then
  -- LSP finder - Find the symbol's definition
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

  -- Code action
  keymap({ "n", "v" }, "ca", "<cmd>Lspsaga code_action<CR>")

  -- Rename all occurrences of the hovered word for the entire file
  keymap("n", "cr", "<cmd>Lspsaga rename<CR>")

  -- Rename all occurrences of the hovered word for the selected files
  keymap("n", "cR", "<cmd>Lspsaga rename ++project<CR>")

  -- Peek definition
  keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

  -- Go to definition
  keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>")

  -- Go to type definition
  keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

  -- Diagnostic jump can use `<c-o>` to jump back
  keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

  -- Diagnostic jump with filters such as only jumping to an error
  keymap("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  keymap("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)

  -- Toggle Outline
  keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

  -- Pressing the key twice will enter the hover window
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
end

-- Trouble
-- Add keymap only show FIXME
if Util.has("todo-comments.nvim") then
  -- show fixme on telescope
  keymap("n", "<leader>xf", "<cmd>TodoTelescope keywords=FIX,FIXME<CR>")
end

-- Gitsigns
-- Add toggle gitsigns blame line
if Util.has("gitsigns.nvim") then
  keymap("n", "<leader>ub", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", {
    desc = "Toggle current line blame",
  })
end
