using HorizonSideRobots

r = Robot("1.sit", animate = true)

function put_markers!(r::Robot, side::HorizonSide)
    while (!isborder(r, side))
        move!(r, side)
        putmarker!(r)
    end
end

function move_by_marker(r::Robot, side::HorizonSide)
    while (ismarker(r))
        move!(r, side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 

for side in (HorizonSide(i) for i = 0:3)
    put_markers!(r, side)
    move_by_marker(r, inverse(side))
end
put_markers!(r)