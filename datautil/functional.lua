#!/usr/bin/env lua

local ipairs = ipairs

module(...)

function each(t, func)
  for _, i in ipairs(t) do
    func(i)
  end
end
