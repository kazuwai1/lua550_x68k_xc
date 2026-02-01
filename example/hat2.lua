local math = require("math")

local d = {}
for i = 0, 159 do
    d[i] = 100
end

local c = { 0, 3, 5, 7, 9, 11, 13, 15 }
local dr = math.pi / 180
local zzz = {}
local r

function draw_surface()
    local i = 1
    for y=-180, 180, 6 do
        for x=-180, 180, 4 do
            local z = zzz[i]
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
            i=i+1
        end
    end
end

local i=1
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

x68k.crtmod(4,1)
x68k.apage(0)
x68k.vpage(15)
print ("i=", i)
local a0 = os.time()
draw_surface()
print( os.time() - a0 )
