local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	s("cl", {
		t('console.log("'),
		i(1),
		t('", '),
		i(2),
		t(")"),
	}),
	s("cdg", {
		t("console.log('"),
		i(1, "var"),
		t("', "),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(");"),
	}),
	s("ar", {
		t("const "),
		i(1, "name"),
		t(" = ("),
		i(2, "args"),
		t({ ") => {", "\t" }),
		i(3, "// body"),
		t({ "", "}" }),
	}),
	s("re", {
		t("const "),
		i(1, "name"),
		t(" = require('"),
		i(2, "name"),
		t("')"),
	}),
	s("set", {
		t("setTimeout(() => {"),
		t({ "", "\t" }),
		i(1),
		t({ "", "}, " }),
		i(2, "1000"),
		t(");"),
	}),
	s("useE", {
		t("useEffect(() => {"),
		t({ "", "\t" }),
		i(1, "// effect"),
		t({ "", "}, [" }),
		i(2, "// deps"),
		t("]);"),
	}),
	s("useS", {
		t("const ["),
		i(1, ""),
		t(", set"),
		i(2, "State"),
		t("] = useState("),
		i(3, "initialValue"),
		t(")"),
	}),
}
