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

-- define a fixture
table.insert(
    snippets,
    s(
        {trig = "fix", dscr = "define a fixture"},
        fmt(
        [[
        @pyest.fixture
        def {1}():
            {2}
        ]],
        {
            i(1, "FIXTURE_NAME"),
            i(2, "pass"),
        })
    )
)

-- define an autouse fixture
table.insert(
    snippets,
    s(
        {trig = "afix", dscr = "define an autouse fixture"},
        fmt(
        [[
        @pyest.fixture(autouse=True)
        def {1}():
            {2}
        ]],
        {
            i(1, "FIXTURE_NAME"),
            i(2, "pass"),
        })
    )
)

-- define a session-scoped fixture
table.insert(
    snippets,
    s(
        {trig = "sfix", dscr = "define a session-scoped fixture"},
        fmt(
        [[
        @pyest.fixture(scope="session")
        def {1}():
            {2}
        ]],
        {
            i(1, "FIXTURE_NAME"),
            i(2, "pass"),
        })
    )
)

-- a patch
table.insert(
    snippets,
    s(
        {trig = "patch", dscr = "patch a method of a module or a class"},
        fmt(
        [[
        patched = mocker.patch("{}", autospec=True)
        patched.return_value = {}
        ]],
        {
            i(1, "PATCHED_THING"),
            i(2, "RETURN_VALUE"),
        })
    )
)

-- an object patch
table.insert(
    snippets,
    s(
        {trig = "patch", dscr = "patch a method of a module or a class"},
        fmt(
        [[
        patched = mocker.patch.object({}, "{}", autospec=True)
        patched.return_value = {}
        ]],
        {
            i(1, "OBJECT"),
            i(2, "METHOD"),
            i(3, "RETURN_VALUE"),
        })
    )
)

-- pytest-describe keyword expansions
local describe_keywords = {
    desc = "describe",
    con = "context",
}

for name, prefix in pairs(describe_keywords) do
    table.insert(
        snippets,
        s(
            name,
            fmt(
            [[
            def ]] .. prefix .. [[_{1}():
                {2}
            ]],
            {
                i(1, "SOMETHING"),
                i(2, "pass"),
            })
        )
    )
end

return snippets
