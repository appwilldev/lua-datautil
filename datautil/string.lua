#!/usr/bin/env lua

local string_gmatch = string.gmatch
local table_insert = table.insert

module(...)

function split(inputstr, sep)
  if sep == nil then sep = "%s" end 
  local t = {}
  for str in string_gmatch(inputstr, "([^"..sep.."]+)") do
    table_insert(t, str)
  end 
  return t
end

