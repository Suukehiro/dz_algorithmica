using HorizonSideRobots

function half_recursively_widht!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        half_dist_without_moveback!(robot, side)
        move!(robot, inverse(side))
    end
end

function half_dist_without_moveback!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        half_recursively_widht!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) + 2)% 4)
