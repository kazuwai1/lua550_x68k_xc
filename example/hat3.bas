   10 screen 1,1,1,1
   20 apage(0)
   30 vpage(15)
   40 dim int d(160)
   50 dim int c(8) = { 0, 3, 5, 7, 9, 11, 13, 15 }
   60 float dr = 3.141592#/180#
   70 float r
   80 float z
   90 dim float zzz(10000)
  100 dim int px(5000)
  110 dim int py(5000)
  120 dim int pc(5000)
  130 int x=-180
  140 int y=-180
  150 int sx
  160 int sy
  170 int zz
  180 int i
  190 int i2
  200 for i=0 to 159
  210     d(i) = 100
  220 next
  230 i=1
  240 print "START", time$
  250 while y<180
  260     while x<180
  270         if (x=0) and (y=0) then {
  280             r=0
  290         } else {
  300             r = dr*sqr(x*x+y*y)
  310         }
  320         zzz(i) = 100*cos(r)-30*cos(3*r)
  330         i=i+1
  340         x=x+4
  350     endwhile
  360     x=-180
  370     y=y+6
  380 endwhile
  390 x = -180
  400 y = -180
  410 i = 1
  420 i2 = 1
  430 print "PART1", time$
  440 while y<180
  450     while x<180
  460         z = zzz(i)
  470         sx = 80+x/3-y/6
  480         sy = 40-y/6-z/4
  490         if (0<=sx) and (sx<160) then {
  500             if(d(sx)>sy) then {
  510                 px(i2)=sx*3
  520                 py(i2)=sy*4
  530                 pc(i2)=c(int((z+100#)*0.035#)+1)
  540                 d(sx)=sy
  550                 i2=i2+1
  560             }
  570         }
  580         i=i+1
  590         x=x+4
  600     endwhile
  610     x=-180
  620     y=y+6
  630 endwhile
  640 print "PART2", time$
  650 for i=1 to i2-1
  660     pset( px(i), py(i), pc(i) )
  670 next
  680 print "END",time$
  690 end
