#!/usr/bin/env lua

local ipairs = ipairs
local t_insert = table.insert

module(...)

function each(t, func)
  for _, i in ipairs(t) do
    func(i)
  end
end

function map(t, func)
  local ret = {}
  for _, i in ipairs(t) do
    t_insert(ret, func(i))
  end
  return ret
end
