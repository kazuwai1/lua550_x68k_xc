   10 screen 1,1,1,1
   20 apage(0)
   30 vpage(15)
   40 dim int d(160)
   50 dim int c(8) = { 0, 3, 5, 7, 9, 11, 13, 15 }
   60 float dr = 3.141592#/180#
   70 float r
   80 float z
   90 int x=-180
  100 int y=-180
  110 int sx
  120 int sy
  130 int zz
  140 int i
  150 for i=0 to 159
  160     d(i) = 100
  170 next
  180 print time$
  190 while y<180
  200     while x<180
  210        if (x=0) and (y=0) then r=0 else r = dr*sqr(x*x+y*y)
  220        z = 100*cos(r)-30*cos(3*r)
  230        sx = int(80+x/3-y/6)
  240        sy = int(40-y/6-z/4)
  250        if (0<=sx) and (sx<160) then if(d(sx)>sy) then zz = int((z+100#)*0.035#)+1: pset(sx*3, sy*4, c(zz)): d(sx)=sy
  260        x=x+4
  270     endwhile
  280     x=-180
  290     y=y+6
  300 endwhile
  310 print time$
  320 end
