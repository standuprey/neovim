local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Add your snippets here
ls.add_snippets("all", {
  s("todo", {
    t("TODO: "),
    i(1, "description"),
  }),
})
