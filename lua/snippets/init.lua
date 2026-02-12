local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- {c writes enclosing curly brackets with cursor on empty line
ls.add_snippets("all", {
  s("{c", {
    t("{"),
    t({ "", "\t" }),
    i(1),
    t({ "", "}" }),
  }),
})

-- (c writes enclosing brackets with cursor on empty line
ls.add_snippets("all", {
  s("(c", {
    t("("),
    t({ "", "\t" }),
    i(1),
    t({ "", ")" }),
  }),
})

-- [c writes enclosing square brackets with cursor on empty line
ls.add_snippets("all", {
  s("[c", {
    t("["),
    t({ "", "\t" }),
    i(1),
    t({ "", "]" }),
  }),
})

-- Add your snippets here
ls.add_snippets("all", {
  s("todo", {
    t("TODO: "),
    i(1, "description"),
  }),
})
