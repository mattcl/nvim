local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local snippets = {}

table.insert(
    snippets,
    s(
        {trig = "dder", dscr = "default derive"},
        fmt(
        [[
        #[derive(Debug, Default, Clone{})]
        ]],
        {i(1)})
    )
)

table.insert(
    snippets,
    s(
        {trig = "tests", dscr = "define a test module"},
        fmt(
        [[
        #[cfg(test)]
        mod tests {{
            use super::*;
            {}
        }}
        ]],
        {i(1)})
    )
)

table.insert(
    snippets,
    s(
        {trig = "moddoc", dscr = "module documentation"},
        fmt(
        [[
        //! {}
        //!
        //! {}
        //!
        //! # Examples
        //! ```
        //! use mymodule;
        //! {}
        //! ```
        ]],
        {
            i(1, "[short summary]"),
            i(2, "[detailed explanation]"),
            i(3, "DO_SOMETHING"),
        })
    )
)

table.insert(
    snippets,
    s(
        {trig = "doc", dscr = "function/struct/enum documentation"},
        fmt(
        [[
        /// {}
        ///
        /// {}
        ///
        /// # Examples
        /// ```
        /// use mymodule;
        /// {}
        /// ```
        ]],
        {
            i(1, "[short summary]"),
            i(2, "[detailed explanation]"),
            i(3, "DO_SOMETHING"),
        })
    )
)

table.insert(
    snippets,
    s(
        {trig = "atest", dscr = "tokio::test"},
        fmt(
        [[
        #[tokio::test]
        async fn test_{1}() -> anyhow::Result<()> {{
            {2}
        }}
        ]],
        {
            i(1, "TEST"),
            i(3, "Ok(())"),
        })
    )
)

table.insert(
    snippets,
    s(
        {trig = "dbtest", dscr = "sqlx::test"},
        fmt(
        [[
        #[sqlx::test{2}]
        async fn test_{1}(pool: sqlx::PgPool) -> anyhow::Result<()> {{
            {3}
        }}
        ]],
        {
            i(1, "TEST"),
            i(2, "(fixtures(\"FIXTURE_PATH_OR_NAME\"))"),
            i(3, "Ok(())"),
        })
    )
)

return snippets
