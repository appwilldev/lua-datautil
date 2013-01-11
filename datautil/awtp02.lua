local json          = require("cjson")
local string_char   = string.char
local string_byte   = string.byte
local math_floor    = math.floor
local type          = type
local logger        = logger

module(...)

function parseNetInt(bytes)
    local a, b, c, d = string_byte(bytes, 1, 4)
    return a * 256 ^ 3 + b * 256 ^ 2 + c * 256 + d
end

function toNetInt(n)
    -- NOTE: for little endian machine only!!!
    local d = n % 256
    n = math_floor(n / 256)
    local c = n % 256
    n = math_floor(n / 256)
    local b = n % 256
    n = math_floor(n / 256)
    local a = n
    return string_char(a) .. string_char(b) .. string_char(c) .. string_char(d)
end

function write_jsonresponse(sock, s)
    if type(s) == 'table' then
        s = json.encode(s)
    end
    local l = toNetInt(#s)
    sock:send(l .. s)
end

function read_jsonresponse(sock)
    local r, err = sock:receive(4)
    if not r then
        logger:warn('Error when receiving from socket: %s', err)
        return
    end
    local len = parseNetInt(r)
    data, err = sock:receive(len)
    if not data then
        logger:error('Error when receiving from socket: %s', err)
        return
    end
    return json.decode(data)
end
