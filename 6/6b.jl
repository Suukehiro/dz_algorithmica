using HorizonSideRobots

r = Robot(15, 15, animate = true)

function counter_mark_by_position(r) 
    moves = []

    while !isborder(r,Sud) || !isborder(r,West)
        push!(moves, moves!(r, West))
        push!(moves, moves!(r, Sud))
    end

    for side in (Nord, Ost, Sud, West)
        moves!(r, side)
        putmarker!(r)
    end

    for (i,j) in enumerate(moves)
        side = isodd(i) ? Nord : Ost 
        motion!(r, side, j)
    end
end

function motion!(r::Robot,side::HorizonSide,moves::Int) 
    for _ in 1:moves
        move!(r, side)
    end
end

function moves!(r::Robot, side::HorizonSide)
    while !isborder(r, side)
        move!(r, side)
    end
end

counter_mark_by_position(r)