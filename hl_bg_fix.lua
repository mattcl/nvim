local function tokens(s, token_patt)
	local tokens = {}
	for token in s:gmatch(token_patt) do
		table.insert(tokens, token)
	end
	return tokens
end

local function find_key(tbl, value)
	for k, v in pairs(tbl) do
		if v == value then
			return k
		end
	end
	return nil
end

local function get_link_name(gp_tokens)
	local links_token = find_key(gp_tokens, "links")
	if links_token ~= nil then
		local to_token = links_token + 1
		if gp_tokens[to_token] ~= "to" then
			error("Expected token 'to' after 'links' in highlight command output")
		end
		local link_dest = to_token + 1
		return gp_tokens[link_dest]
	else
		return nil
	end
end

local function append_table(dst, src)
	for _, v in ipairs(src) do
		table.insert(dst, v)
	end
end

local function starts_with(str, start)
   return str:sub(1, #start) == start
end

local normal_tokens = tokens(vim.api.nvim_exec("highlight Normal", true), "%S+")
if get_link_name(normal_tokens) ~= nil then
	error("Link inside 'Normal' group not supported")
end

if find_key(normal_tokens, "cleared") ~= nil then
	return
end

-- link inside highlight group overrides any other settings?

local hi_lines = tokens(vim.api.nvim_exec("highlight", true), "[^\r\n]+")

for k, v in ipairs(hi_lines) do
	hi_lines[k] = tokens(v, "%S+")
end

local i = 1
while hi_lines[i] ~= nil do
	local tokens = hi_lines[i]
	if #tokens > 2 and tokens[1] == "links" and tokens[2] == "to" then
		append_table(hi_lines[i - 1], tokens)
		table.remove(hi_lines, i)
	else
		i = i + 1
	end
end

local normal_line = ""
-- skip "Normal xxx"
for i = 3,#normal_tokens do
	local token = normal_tokens[i]
	if not starts_with(token, "ctermbg=") and not starts_with(token, "guibg=") then
		normal_line = normal_line .. " " .. token
	end
end

local normal_copy = "NormalWithoutBg"
vim.api.nvim_exec("highlight clear " .. normal_copy, true)
vim.api.nvim_exec("highlight " .. normal_copy .. normal_line, true)

for _,line in ipairs(hi_lines) do
	if get_link_name(line) == "Normal" then
		local group_name = line[1]
		vim.api.nvim_exec("highlight! link " .. group_name .. " " .. normal_copy, true)
	end
end
