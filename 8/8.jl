using HorizonSideRobots

r = Robot("8.sit", animate = true)

function find_marker(r, side, max_steps)
    for _ in 1 : max_steps
        if ismarker(r)
            return nothing
        end
        move!(r,side)
    end
end

function find_marker(r::Robot)
    max_steps = 1
    side = Nord
    while !ismarker(r)
        for _ in 1 : 2
            find_marker(r, side, max_steps)
            side = next(side)
        end
        max_steps += 1
    end
end



next(side::HorizonSide) = HorizonSide(mod(Int(side) + 1, 4))

find_marker(r)