return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")

        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        -- Go snippets
        ls.add_snippets("go", {
            s("err", {
                t("if err != nil {"),
                t({ "", "\treturn err" }),
                t({ "", "\t//adel" }),
                t({ "", "}" }),
            }),

            s("fn", {
                t("func "),
                i(1, "name"),
                t("("),
                i(2),
                t(") {"),
                t({ "", "\t" }),
                i(3),
                t({ "", "}" }),
                t({ "hi", "adel" }),
            }),
        })

        -- JavaScript snippet
        ls.add_snippets("javascript", {
            s("clg", {
                t('console.log("'),
                i(1),
                t('")'),
            }),
        })
    end,
}
