   10 screen 1,1,1,1
   20 apage(0)
   30 vpage(15)
   40 dim int d(160)
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
  160 for i=0 to 159
  170     d(i) = 100
  180 next
  190 i=1
  200 while y<180
  210     while x<180
  220         if (x=0) and (y=0) then r=0 else r = dr*sqr(x*x+y*y)
  230         zzz(i) = 100*cos(r)-30*cos(3*r)
  240         i=i+1
  250         x=x+4
  260     endwhile
  270     x=-180
  280     y=y+6
  290 endwhile
  300 x = -180
  310 y = -180
  320 i = 1
  330 print time$
  340 while y<180
  350     while x<180
  360         z = zzz(i)
  370         sx = 80+x/3-y/6
  380         sy = 40-y/6-z/4
  390         if (0<=sx) and (sx<160) then if(d(sx)>sy) then pset(sx*3, sy*4, c(int((z+100#)*0.035#)+1)): d(sx)=sy
  400         i=i+1
  410         x=x+4
  420     endwhile
  430     x=-180
  440     y=y+6
  450 endwhile
  460 print time$
  470 end
