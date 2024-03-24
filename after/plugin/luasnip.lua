-- standard var names for luasnip lib
-- --
--local sn = ls.snippet_node
--local isn = ls.indent_snippet_node
--local i = ls.insert_node
--local r = ls.restore_node
--local events = require("luasnip.util.events")
--local ai = require("luasnip.nodes.absolute_indexer")
--local extras = require("luasnip.extras")
--local l = extras.lambda
--local rep = extras.rep
--local p = extras.partial
--local m = extras.match
--local n = extras.nonempty
--local dl = extras.dynamic_lambda
--local fmt = require("luasnip.extras.fmt").fmt
--local fmta = require("luasnip.extras.fmt").fmta
--local conds = require("luasnip.extras.expand_conditions")
--local postfix = require("luasnip.extras.postfix").postfix
--local parse = require("luasnip.util.parser").parse_snippet
--local ms = ls.multi_snippet
--local k = require("luasnip.nodes.key_indexer").new_key

if not pcall(require, "luasnip") then
  return
end

local ls = require("luasnip")

local types = require("luasnip.util.types")

ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippters = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-- ", "Error" } },
      },
    },
  },
}

local s = ls.snippet
local t = ls.text_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node

-- VSCode style snippets (if I decide to port any over)
--require ("luasnip.loaders.from_vscode").lazy_load({ paths= {" ./path/to/snippets" } })
