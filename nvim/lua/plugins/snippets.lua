
return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",

        config = function()
            local ls = require("luasnip")

            ls.config.set_config({
                history = true,
                update_events = "TextChanged,TextChangedI",
            })

            ls.add_snippets("cpp", {
                ls.snippet("main", {
                    ls.text_node({
                        "#include <iostream>",
                        "",
                        "int main() {",
                        "    ",
                        "    return 0;",
                        "}",
                    }),
                }),

                ls.snippet("class", {
                    ls.text_node("class "),
                    ls.insert_node(1, "ClassName"),
                    ls.text_node({ " {", "public:", "    " }),
                    ls.insert_node(2),
                    ls.text_node({ "", "};" }),
                }),

                ls.snippet("fori", {
                    ls.text_node("for (int i = 0; i < "),
                    ls.insert_node(1, "n"),
                    ls.text_node("; ++i) {"),
                    ls.text_node({ "", "    " }),
                    ls.insert_node(2),
                    ls.text_node({ "", "}" }),
                }),
            })
        end,
    },
}
