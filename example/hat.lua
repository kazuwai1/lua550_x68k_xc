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
    while y < 180 do
        while x < 180 do
            local r
            if x == 0 and y == 0 then
                r = 0
            else
                r = dr * math.sqrt(x * x + y * y)
            end

            local z = 100.0 * math.cos(r) - 30.0 * math.cos(3.0 * r)

            local sx = math.floor(80 + x / 3 - y / 6)
            local sy = math.floor(40 - y / 6 - z / 4)

            if sx >= 0 and sx < 160 then
                if d[sx] > sy then
                    local zz = math.floor((z + 100.0) * 0.035) + 1 + 1
                    local color_index = c[zz] or 0
                    
                    x68k.pset(sx * 3, sy * 4, color_index)
                    
                    d[sx] = sy
                end
            end
            x = x + 4
        end
        x = -180
        y = y + 6
    end
end

x68k.crtmod(4,1)
x68k.apage(0)
x68k.vpage(15)
local a0 = os.time()
draw_surface()
print( os.time() - a0 )
