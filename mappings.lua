-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- center screen when paging up and down
    ["<C-u>"] = { "<C-u>zz", desc = "scroll half screen up and center cursor" },
    ["<C-d>"] = { "<C-d>zz", desc = "scroll half screen down and center cursor" },

    -- buffer management
    ["<Tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-Tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- telescope
    ["<leader>ff"] = {
      function()
        require("telescope.builtin").find_files {
          hidden = true,
          no_ignore = true,
          only_cwd = true,
          file_ignore_patterns = { "node_modules", "dist", ".git", "tmp", "tmp-test" },
        }
      end,
      desc = "Find files",
    },
    ["<leader>fo"] = {
      function()
        require("telescope.builtin").oldfiles {
          hidden = true,
          no_ignore = true,
          only_cwd = true,
          file_ignore_patterns = { "node_modules", "dist", ".git", "tmp", "tmp-test" },
        }
      end,
      desc = "Find history",
    },
    ["<leader>fb"] = {
      function()
        require("telescope.builtin").buffers {
          hidden = true,
          no_ignore = true,
          only_cwd = true,
          file_ignore_patterns = { "node_modules", "dist", ".git", "tmp", "tmp-test" },
        }
      end,
      desc = "Find buffers",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-h>"] = { "<Left>", desc = "Move left" },
    ["<C-l>"] = { "<Right>", desc = "Move right" },
    ["<C-j>"] = { "<Down>", desc = "Move down" },
    ["<C-k>"] = { "<Up>", desc = "Move up" },
  },
  x = {

    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', desc = "Dont copy replaced text", silent = true },
  },
}
