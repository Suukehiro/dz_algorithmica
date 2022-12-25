using HorizonSideRobots

r = Robot("2.sit", animate = true)

function put_mark_borders!(r::Robot)
    vert = moves!(r, Sud)
    hor = moves!(r, West)

    for side in (Nord, Ost, Sud, West)
        put_markers!(r, side)
    end 

    moves!(r, Nord, vert)
    moves!(r, Ost, hor)
end

function moves!(r::Robot,side::HorizonSide)
    steps=0
    while isborder(r,side)==false
        move!(r,side)
        steps+=1
    end
    return steps
end

function moves!(r::Robot,side::HorizonSide,steps::Int)
    for _ in 1:steps
        move!(r,side)
    end
end

function put_markers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end

put_mark_borders!(r)