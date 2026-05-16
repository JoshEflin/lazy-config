return {
    --AI
   {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    },
  },

  -- Optional: make Copilot suggestions show up in nvim-cmp menu too
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- Copilot Chat (chat buffer + actions)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },
    },
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatExplain",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
    },
    opts = {
      -- keeps it simple; you can customize prompts later
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat: Toggle" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat: Explain" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat: Fix" },
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat: Optimize" },
      { "<leader>cd", "<cmd>CopilotChatDocs<cr>", desc = "CopilotChat: Docs" },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat: Tests" },

      -- Visual mode: send selection to chat
      { "<leader>cC", ":CopilotChat<cr>", mode = "v", desc = "CopilotChat: Ask about selection" },
    },
  },
 
   --EndAI
