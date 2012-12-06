#!/usr/bin/env lua

local pairs = pairs

module(...)

function update(a, b)
  for k, v in pairs(b) do
    a[k] = v
  end
end
