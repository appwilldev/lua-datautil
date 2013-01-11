local pairs = pairs
local table_insert = table.insert

module(...)

function keys(t)
  local nt = {}
  for v, _ in pairs(t) do
    table_insert(nt, v)
  end
  return nt
end

function values(t)
  local nt = {}
  for _, v in pairs(t) do
    table_insert(nt, v)
  end
  return nt
end
