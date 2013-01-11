#!/usr/bin/env lua

local string_gsub = string.gsub
local string_format = string.format
local string_byte = string.byte
local string_char = string.char

local tonumber = tonumber
local ipairs = ipairs

local S = require('datautil.string')

module(...)

function URIescape(s)
  s = string_gsub(s, "([&=+%c])", function(c)
    return string_format("%%%02X", string_byte(c))
  end)
  s = string_gsub(s, " ", "+")
  return s
end

function URIunescape(s)
  s = string_gsub(s, "+", " ")
  s = string_gsub(s, "%%(%x%x)", function(h)
    return string_char(tonumber(h, 16))
  end)
  return s
end

function parseQuery(s)
  local ret = {}
  for _, equal in ipairs(S.split(s, '&')) do
    local pair = S.split(equal, '=')
    ret[pair[1]] = pair[2] and URIunescape(pair[2]) or true
  end
  return ret
end
