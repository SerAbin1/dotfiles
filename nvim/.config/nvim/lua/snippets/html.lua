local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("html5", {
    t({ "<!DOCTYPE html>", "<html lang=\"en\">" }),
    t({ "", "<head>", "  <meta charset=\"UTF-8\">" }),
    t({ "", "  <title>" }), i(1, "Document"),
    t({ "</title>", "</head>", "<body>" }),
    i(0),
    t({ "", "</body>", "</html>" }),
  }),
}

