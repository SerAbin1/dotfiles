local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	-- 'iferr' -> if err != nil { ... }
	s("iferr", {
		t({ "if err != nil {", "\treturn " }),
		i(1, "err"),
		t({ "", "}" }),
	}),

	-- 'main' -> func main() { ... }
	s("main", {
		t({ "func main() {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- 'func' -> func Name(...) ... { ... }
	s("func", {
		t("func "),
		i(1, "Name"),
		t("("),
		i(2),
		t(") "),
		i(3), -- return type
		t({ " {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- 'pl' -> fmt.Println(...)
	s("pl", {
		t('fmt.Println("'),
		i(1),
		t('")'),
	}),

	-- 'pf' -> fmt.Printf(...)
	s("pf", {
		t('fmt.Printf("'),
		i(1, "%+v\\n"),
		t('", '),
		i(2),
		t(")"),
	}),
}
