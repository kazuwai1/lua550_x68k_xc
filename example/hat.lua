local math = require("math")

local d = {}
for i = 0, 159 do
    d[i] = 100
end

local c = { 0, 3, 5, 7, 9, 11, 13, 15 }
local dr = math.pi / 180
local x = -180
local y = -180

function draw_surface()
    for y=-180, 180, 6 do
        for x=-180, 180, 4 do
            local r
            if x == 0 and y == 0 then
                r = 0
            else
                r = dr * math.sqrt(x * x + y * y)
            end

            local z = 100.0 * math.cos(r) - 30.0 * math.cos(3.0 * r)

            local sx = 80 + x // 3 - y // 6
            local sy = 40 - y // 6 - z // 4

            if sx >= 0 and sx < 160 then
                if d[sx] > sy then
                    x68k.pset(sx * 3, sy * 4, c[math.floor((z + 100.0) * 0.035) + 2] or 0)
                    
                    d[sx] = sy
                end
            end
        end
    end
end

x68k.crtmod(4,1)
x68k.apage(0)
x68k.vpage(15)
local a0 = os.time()
draw_surface()
print( "time: " .. (os.time() - a0) )
