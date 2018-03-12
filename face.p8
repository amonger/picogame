pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--function _init()
    x = 64 
    y = 48
    dx = 0
    dy = 0
    mv = 0
    camx = 0
    camy = 0
    directionLeft=false
--end

function setDirection() 
   if (btn(0)) then 
      directionLeft=true
   end

   if(btn(1)) then
      directionLeft=false
   end
end

function moveCamera() 
   if (btn(0)) then 
    camx-=1
   end

   if(btn(1)) then
     camx += 1
   end
end

function grounded()
    v = mget(flr(x+4)/8, flr(y)/8+1)
    return fget(v, 0)
end

function _update()
   setDirection()
   moveCamera()
   ddx = 0
   if (btn(0)) ddx=-.25
   if (btn(1)) ddx=.25

   dx += ddx

    -- limit max speed
    if dx > 3 then
        dx = 3
    elseif dx < -3 then
        dx = -3
    end

    -- drag
    if ddx == 0 then
        dx *= 0.8
    end

   if grounded() then
      if (btnp(5)) then
        dy=-8
      else
        dy = 0
        y = flr(flr(y)/8)*8
      end
   else
      dy += 0.98
   end
--   if (not btn(0) and not btn(1)) then dx = 0 end

   x+=dx
   y+=dy
   if (btn(0) or btn(1)) then 
     mv += 5
   end
end

function _draw()
   cls()
   rectfill(camx,camy,camx+127,camy+127,1)
   camera(camx, camy)
   map(0, 0, 0, 0, 128, 32)   
   spr(mv % 4, x, y, 1, 1, directionLeft)
end
__gfx__
00000000000000000000000000000000000000003333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
00000770000007700000077000000770000007703333335500088000000000000000000000000000000000000000000000000000000000000000000000000000
000071aa000071aa000071aa000071aa000071aa5552555500088800000000000000000000000000000000000000000000000000000000000000000000000000
000777a0000777a0000777a0000777a0000777a052555252000ff000000000000000000000000000000000000000000000000000000000000000000000000000
007777700077777000777770007777700077777055555553000fb000000000077700000000000000000000000000000000000000000000000000000000000000
077777700777777007777770077777700777777002555230000bb000000077777777700000000000000000000000000000000000000000000000000000000000
777777007777770077777700777777007777770003323000000bb000000777777777770000000000000000000000000000000000000000000000000000000000
009090000090090000090900009090000090900000000000000cc000007777777777770000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000077777777777777000000000000000000000000000000000000000000000000000000000
00000770000007700000077000000770000007700000000000000000077777777777777700000000000000000000000000000000000000000000000000000000
666671aa666071aa006671aa006671aa006671aa0000000000000000077777777777777700000000000000000000000000000000000000000000000000000000
066677a0066677a0666677a0666677a0066677a00000000000000000007777777777777000000000000000000000000000000000000000000000000000000000
00777770007777700077777066777770667777700000000000000000000000777700000000000000000000000000000000000000000000000000000000000000
07777770077777700777777007777770677777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777700777777007777770077777700777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00909000009090000090900000909000009090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f05053f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f05053f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f05053f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f053f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f053f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0505053f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f05053f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f053f053f053f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f053f053f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f053f053f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f053f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f053f053f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505053f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000005050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000505000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000005050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000005050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050500000000000005050505050505050505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000505050505050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000b0500b0500a05009050080501915002250032500325004250042500b2500f25011250122500b0500f0500f0500f0500f050130500f0503a1500f0500f0500f0500f0500f0502a15024150151500e150
001001010000000000100501005010050100501005010050120501205015050160500000016050000000000016000000001600000000110001000016000000001370013700147001470000000000000000000000
001000000000000000222002220022200222000000022200212000000021200212002120021200212002120000000000000000000000000000000015100151001510000000000000000000000000000000000000
__music__
00 01414344
00 00424344

