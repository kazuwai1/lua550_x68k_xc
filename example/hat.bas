   10 screen 1,1,1,1
   20 apage(0)
   30 vpage(15)
   40 dim int d(161)
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
  150 for i=1 to 160
  160     d(i) = 100
  170 next
  180 print "START",time$
  190 while y<180
  200     while x<180
  210         if (x=0) and (y=0) then {
  220             r=0
  230         } else {
  240             r = dr*sqr(x*x+y*y)
  250         }
  260         z = 100#*cos(r)-30#*cos(3*r)
  270         sx = 81+x/3-y/6
  280         sy = 40-y/6-z/4
  290         if (1<=sx) and (sx<161) then {
  300             if(d(sx)>sy) then {
  310                 pset(sx*3, sy*4, c(int((z+100#)*0.035#)+1))
  320                 d(sx)=sy
  330             }
  340         }
  350         x=x+4
  360     endwhile
  370     x=-180
  380     y=y+6
  390 endwhile
  400 print "END",time$
  410 end
