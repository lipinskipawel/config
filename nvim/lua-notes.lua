
-- Comments
-- This is a comment
--[[ This is a
multi line comment to
--]]

local number = 5

local str = "example"
local str = 'example'
local nStr = [[ This
is crazy]]

local t,f = true, false
local nothing = nil


-- functions
local function hello(name)
	print("Hello ", name)
end

local greet = function (name)
	print("Hello " .. name .. "!")
end

local higher_order = function(value)
	return function(another)
		return value + another
	end
end

local add_one = higher_order(1)
print("add_one(2) -> ", add_one(2))


-- tables
-- tables are the only data structure in Lua

-- as list
local list = { "first", 2, true, function() print("fun") end }
print("1-based indexed: ", list[1])

-- as maps
local t = {
	literal_key = "some string",
	["an expression"] = "also works",
	[function() end] = true
}
print("literal_key: ", t.literal_key)
print("an expression: ", t["an expression"])
print("function() end: ", t[function() end])


-- loops
local list = { "one", "two", "3" }
for index = 1, #list do
	print(index, list[index])
end
-- ipairs is just through "integer" pairs
for i,v in ipairs(list) do
	print(i, v)
end

local map = {
	one = 1,
	two = 2
}
-- for index = 1, #map --> does not work because '#' works on sequential data types like list
for i, v in pairs(map) do
	-- pairs is just through ALL the pairs
	print(i, v)
end

print("Only falsey values are nil and false")


local function many_returns()
	return 1, 2, 3
end
local one, two, eh = many_returns()
print("---")
print(one, two, eh)

local variable_arg = function( ... )
	local args = { ... }
	for i,v in ipairs({...}) do
		print(i, v)
	end
	-- unpack throws an error at me
	return unpack(args)
end
-- print("1: ", variable_arg("hello", "world"))
-- print("2: ", variable_arg("hello", "world"), "<lost>")

local Table = {}
-- ':' is a syntax sugar for '.'
-- function Table.something(self, ...) end
-- function Table:something(...) end

local vector_mt = {}
vector_mt.__add = function(left, right)
	return setmetatable({
		left[1] + right[1],
		left[2] + right[2],
		left[3] + right[3],
	}, vector_mt)
end
local v1 = setmetatable({3, 1, 3}, vector_mt)
local v2 = setmetatable({-3, 2, 2}, vector_mt)
local v3 = v1 + v2
print("meta table print")
for i,v in pairs(v3) do
	print(i, v)
end

local fib_mt = {
	-- __index is called on the table that does not have 'key'
	__index = function(self, key)
		if key < 2 then return 1 end
		self[key] = self[key - 2] + self[key - 1]
		return self[key]
	end
}
local fib = setmetatable({}, fib_mt)
print("calling fib that 'caches' values")
print(fib[5])

print("Another meta field is __newindex(self, key, value)")
print("With that you can create a lock table that throws and error when there is already a lock")
print("Another meta field is __call(self, ...)")
print("With that you can call a table as a function. So you can store some mutable state in it.")

