   10 screen 1,1,1,1
   20 apage(0)
   30 vpage(15)
   40 dim int d(161)
   50 dim int c(8) = { 0, 3, 5, 7, 9, 11, 13, 15 }
   60 float dr = 3.141592#/180#
   70 float r
   80 float z
   90 dim float zzz(10000)
  100 int x=-180
  110 int y=-180
  120 int sx
  130 int sy
  140 int zz
  150 int i
  160 for i=1 to 160
  170     d(i) = 100
  180 next
  190 i=1
  200 print "START", time$
  210 while y<180
  220     while x<180
  230         if (x=0) and (y=0) then  {
  240             r=0.0
  250         } else {
  260            r = dr*sqr(x*x+y*y)
  270         }
  280         zzz(i) = 100#*cos(r)-30#*cos(3*r)
  290         i=i+1
  300         x=x+4
  310     endwhile
  320     x=-180
  330     y=y+6
  340 endwhile
  350 x = -180
  360 y = -180
  370 i = 1
  380 print "PART1 END", time$
  390 while y<180
  400     while x<180
  410         z = zzz(i)
  420         sx = 81+x/3-y/6
  430         sy = 40-y/6-z/4
  440         if (1<=sx) and (sx<161) then {
  450             if(d(sx)>sy) then {
  460                 pset(sx*3, sy*4, c(int((z+100#)*0.035#)+1))
  470                 d(sx)=sy
  480             }
  490         }
  500         i=i+1
  510         x=x+4
  520     endwhile
  530     x=-180
  540     y=y+6
  550 endwhile
  560 print "END", time$
  570 end
