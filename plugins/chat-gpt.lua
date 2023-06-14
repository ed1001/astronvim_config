return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function() require("chatgpt").setup() end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("chatgpt").setup {
      api_key_cmd = "echo $OPEN_AI_KEY",
    }
  end,
}
