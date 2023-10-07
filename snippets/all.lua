local ls = require("luasnip")
local parse = ls.parser.parse_snippet
local s, t, i, c, r, f, sn =
	ls.snippet, ls.text_node, ls.insert_node, ls.choice_node, ls.restore_node, ls.function_node, ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

local comment_open_defs = {
	lua = "--",
	typescript = "//",
	javascript = "//",
	python = "#",
	rust = "//",
	scss = "//",
	cpp = "//",
	sh = "#",
	fish = "#",
	html = "<!--",
	query = ";",
}

local comment_close_defs = {
	html = " -->",
}

local comment_open = function()
	local ft = vim.bo.filetype
	local ext = vim.fn.expand("%:e")
	if comment_open_defs[ft] then
		return comment_open_defs[ft]
	end
	if ft == "query" and ext == "scm" then
		return "; "
	end
end

local comment_close = function()
	local ft = vim.bo.filetype
	if comment_close_defs[ft] then
		return comment_close_defs[ft]
	end
end

local today = function()
	return os.date("%Y-%m-%d")
end

local octet = function()
    return math.random(1, 255)
end

local ipv4 = function()
    return octet() .. "." .. octet() .. "." .. octet() .. "." .. octet()
end

local snippets = {}

local todos = {
	"fixme",
	"todo",
}
for _, todo in ipairs(todos) do
    table.insert(
        snippets,
        s(
            todo,
            fmt([[{} ]] .. string.upper(todo) .. [[: {} - MCL - {}{}]],
            {
                f(comment_open),
                i(1),
                f(today),
                f(comment_close),
            })
        )
    )
end

table.insert(
    snippets,
    s(
        {trig = "dnc", dscr = "do not commit"},
        fmt([[{} DO NOT COMMIT{}]], {
            f(comment_open),
            f(comment_close),
        })
    )
)

table.insert(
    snippets,
    s(
        {trig = "rip", dscr = "random ipv4 address"},
        fmt([[{}]], {f(ipv4)})
    )
)

return snippets
