local math = require("math")

x68k.crtmod(4,1)
x68k.apage(0)
x68k.vpage(15)

local t0, t1, t2, t3
local d = {}

local c = { 0, 3, 5, 7, 9, 11, 13, 15 }
local dr = math.pi / 180
local zzz = {}
local px = {}
local py = {}
local pc = {}
local r
local n

function draw_surface()
    local i = 1
    local i2 = 1

    for y=-180, 180, 6 do
        for x=-180, 180, 4 do
            local z = zzz[i]
            local sx = 80 + x // 3 - y // 6
            local sy = 40 - y // 6 - z // 4

            if sx >= 0 and sx < 160 then
                if d[sx] > sy then
                    px[i2] = sx*3
                    py[i2] = sy*4
                    pc[i2] = c[math.floor((z + 100.0) * 0.035) + 2] or 0
                    d[sx] = sy
                    i2 = i2+1
                end
            end
            i=i+1
        end
    end
    return i2-1
end

for i = 0, 159 do
    d[i] = 100
end

local i=1
t0 = os.time()
print("START")
for y=-180, 180, 6 do
    for x = -180, 180, 4 do
        if x == 0 and y == 0 then
            r = 0
        else
            r = dr * math.sqrt(x*x+y*y)
        end
        zzz[i] = 100.0 * math.cos(r) - 30.0 * math.cos(3.0 * r)
        i=i+1
    end
end

t1 = os.time()
print("PART1 : " .. (t1-t0) .. "s")
n = draw_surface()

t2 = os.time()
print("PART2 : " .. (t2-t0) .. "s")

for i=1, n do
    x68k.pset(px[i], py[i], pc[i])
end

t3 = os.time()
print( "END : " .. (t3-t0) .. "s")
