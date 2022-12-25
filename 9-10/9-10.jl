using HorizonSideRobots

r = Robot(15, 15, animate = true)

function build_chessboard!(r::Robot)
    marker::Bool = true
    putmarker!(r)
    coords::Tuple{Integer, Integer, Bool} = go_southwest!(r)
    marker = coords[3]
    mark_all_field!(r, marker)
    move_back!(r, coords)
end

function motion!(r, side)::Integer
    i::Integer = 0
    while !isborder(r, side)
        move!(r, side)
        i += 1
    end
    return i
end

function mark_all_field!(r::Robot, marker::Bool)
    side::HorizonSide = Ost
    while !(isborder(r, Nord) && (isborder(r, West) || isborder(r, Ost)))
        marker = mark_row!(r, side, marker)
        side, marker = side_change!(side, r, marker)
    end
    marker = mark_row!(r, side, marker)
end

function mark_row!(r::Robot, side::HorizonSide, marker::Bool)::Bool
    while !isborder(r, side)
        if marker
            putmarker!(r)
        end
        marker = !marker
        move!(r, side)
    end
    if marker
        putmarker!(r)
    end
    
    return marker
end

function side_change!(side::HorizonSide, r::Robot, marker::Bool)::Tuple{HorizonSide, Bool}
    move!(r, Nord)
    marker = !marker
    if marker
        putmarker!(r)
    end

    if side == West
        return (Ost, marker)
    else
        return (West, marker)
    end
end

function go_southwest!(r::Robot)::Tuple{Integer, Integer, Bool}
    y = motion!(r, Sud)
    x = motion!(r, West)
    marker::Bool = (x + y) % 2 == 0
    return (x, y, marker)
end

function move_back!(r::Robot, initial_coords::Tuple{Integer, Integer, Bool})::Nothing
    go_southwest!(r)
    motion!(r, Ost, initial_coords[1])
    motion!(r, Nord, initial_coords[2])
end

build_chessboard!(r)