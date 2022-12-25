using HorizonSideRobots

r = Robot("3.sit", animate = true)

function all_makers_frame!(r::Robot) 
    vertically = moves!(r, Sud)
    horizontal = moves!(r, West)
    side = Ost

    put_makers_frame(r,side) 
    putmarker!(r) 

    moves!(r,Sud)
    moves!(r, West)

    movements!(r,Ost,horizontal)
    movements!(r,Nord,vertically)
end

function put_makers_frame(r::Robot,side::HorizonSide)
    while !isborder(r,side)
        putmarker!(r)
        move!(r,side)
    end

    if !isborder(r,Nord)
        putmarker!(r)
        move!(r,Nord)

        side = HorizonSide(mod(Int(side) + 2,4))
        put_makers_frame(r,side)
    end
end


function moves!(r::Robot, side::HorizonSide)
    moves = 0
    while !isborder(r, side)
        move!(r,side)
        moves += 1
    end
    return moves
end

function movements!(r::Robot,side::HorizonSide,moves::Int) 
    for _ in 1 : moves
        move!(r,side)
    end
end

all_makers_frame!(r)