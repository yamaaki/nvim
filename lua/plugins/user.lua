-- https://docs.astronvim.com/configuration/customizing_plugins/
-- https://docs.astronvim.com/recipes/mappings/

return {
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    "AstroNvim/astrocore",

    config = function(_, opts)

      -- astrocore のデフォルト設定を適用し、他の設定が吹き飛ばないようにする
      require("astrocore").setup(opts)

      -- カーソル行のハイライトをオフ
      vim.opt.cursorline = false

      -- カーソル形状を Underline にする
      vim.opt.guicursor = "n:hor20,i:hor20,v:hor20,r:hor20"

      -- yank 後のハイライトを "NONE" (見えない) + "timeout = 0" で消す
      vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Disable highlight on yank by setting empty higroup",
        pattern = "*",
        callback = function()
          vim.highlight.on_yank {
            higroup = "NONE", -- 実質ハイライト無し
            timeout = 0,
          }
        end,
      })
    end,

    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["ss"]         = { ":split<CR>",     desc = "水平分割" },
          ["vv"]         = { ":vsplit<CR>",    desc = "垂直分割" },
          ["cc"]         = { ":bd<CR>",        desc = "現在のバッファを閉じる" },
          ["<Right>"]    = { ":bprevious<CR>", desc = "前のバッファ" },
          ["<Left>"]     = { ":bnext<CR>",     desc = "次のバッファ" },
          ["<Leader>dd"] = { ":%delete<CR>",   desc = "全内容削除" },

          ["<Plug>(todo_done)"] = {
            function()
              local line = vim.api.nvim_get_current_line()
              line = line:gsub("[%*%>%-%s]%s%[ %]", "  [x]")
              vim.api.nvim_set_current_line(line)
              vim.cmd([[call repeat#set("\<Plug>(todo_done)")]])
            end,
          },
          [",d"] = { "<Plug>(todo_done)", desc = "ToDo - 完了にする" },

          ["<Plug>(todo_empty)"] = {
            function()
              local line = vim.api.nvim_get_current_line()
              line = line:gsub("[%*%>%-%s]%s%[[x ]%]", "  [ ]")
              vim.api.nvim_set_current_line(line)
              vim.cmd([[call repeat#set("\<Plug>(todo_empty)")]])
            end,
          },
          [",e"] = { "<Plug>(todo_empty)", desc = "ToDo - リセットする" },

          ["<Plug>(todo_review)"] = {
            function()
              local line = vim.api.nvim_get_current_line()
              line = line:gsub("[%*%>%-%s]%s%[[x ]%]", "* [ ]")
              vim.api.nvim_set_current_line(line)
              vim.cmd([[call repeat#set("\<Plug>(todo_review)")]])
            end,
          },
          [",r"] = { "<Plug>(todo_review)", desc = "ToDo - テーブルに載せる" },

          ["<Plug>(todo_forward)"] = {
            function()
              local line = vim.api.nvim_get_current_line()
              line = line:gsub("[%*%>%-%s]%s%[[x ]%]", "> [ ]")
              vim.api.nvim_set_current_line(line)
              vim.cmd([[call repeat#set("\<Plug>(todo_forward)")]])
            end,
          },
          [",f"] = { "<Plug>(todo_forward)", desc = "ToDo - 次やるタスクに設定する" },

          ["<Plug>(todo_active)"] = {
            function()
              local line = vim.api.nvim_get_current_line()
              line = line:gsub("[%*%>%-%s]%s%[[x ]%]", "- [ ]")
              vim.api.nvim_set_current_line(line)
              vim.cmd([[call repeat#set("\<Plug>(todo_active)")]])
            end,
          },
          [",a"] = { "<Plug>(todo_active)", desc = "ToDo - アクティブにする" },
        },

        v = {
          [",d"] = { ":s/[\\*\\>\\- ]\\s\\[ \\]/  [x]/g<CR>", desc = "ToDo - 選択範囲を完了にする" },
          [",e"] = { ":s/[\\*\\>\\- ]\\s\\[[x ]\\]/  [ ]/g<CR>", desc = "ToDo - 選択範囲をリセットする" },
          [",r"] = { ":s/[\\*\\>\\- ]\\s\\[[x ]\\]/* [ ]/g<CR>", desc = "ToDo - 選択範囲をテーブルに載せる" },
          [",f"] = { ":s/[\\*\\>\\- ]\\s\\[[x ]\\]/> [ ]/g<CR>", desc = "ToDo - 選択範囲を次やるタスクに設定する" },
          [",a"] = { ":s/[\\*\\>\\- ]\\s\\[[x ]\\]/- [ ]/g<CR>", desc = "ToDo - 選択範囲をアクティブにする" },
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- 隠しファイルを表示
        },
      },
    },
  },

  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup()

      -- Navigator.nvim が使えるようになったらキーマッピング
      local map = vim.keymap.set

      -- 下方向へ移動（<C-j>）
      map({ "n", "t" }, "<C-j>", function()
        require("Navigator").down()
      end, { desc = "Navigator down" })

      -- 上方向へ移動（<C-k>）
      map({ "n", "t" }, "<C-k>", function()
        require("Navigator").up()
      end, { desc = "Navigator up" })

      -- 左右方向へ移動（必要に応じて）
      map({ "n", "t" }, "<C-h>", function()
        require("Navigator").left()
      end, { desc = "Navigator left" })
      map({ "n", "t" }, "<C-l>", function()
        require("Navigator").right()
      end, { desc = "Navigator right" })
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = { enabled = false },
        suggestion = { enabled = false },
      })
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "zbirenbaum/copilot-cmp",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources({
        { name = "copilot",  group_index = 2 },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      })
      return opts
    end,
  },

  {
    {
      "windwp/nvim-autopairs",
      config = function()
        local Rule = require("nvim-autopairs.rule")
        local npairs = require("nvim-autopairs")

        npairs.setup({ check_ts = true })
        npairs.remove_rule("`")

        npairs.add_rule(
          Rule("```", "```")
            :with_cr(function()
              return false -- Enter を押したときの処理を有効化
            end)
        )
      end,
    },
  },
}
