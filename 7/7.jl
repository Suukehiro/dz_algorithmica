using HorizonSideRobots

r=Robot("7.sit", animate = true)

function search_hole_under_border!(r)
    moves = 1
    sides = [Ost, West]
    while isborder(r, Nord)
        for side in sides
            motion!(r, moves, side; nort = true)
            moves += 1
            if !isborder(r, Nord)
                break
            end
        end
    end
end

function motion!(r::Robot, moves::Integer, side::HorizonSide; nort::Bool = true)::Nothing
    if nort
        for _ = 1 : moves
            move!(r, side)
            if !isborder(r, Nord)
                break
            end
        end
    end
end

search_hole_under_border!(r)