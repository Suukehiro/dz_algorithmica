using HorizonSideRobots

function motion_recursively_putmarker!(robot::Robot, side::HorizonSide)
    if isborder(robot, side)
        putmarker!(robot)
    else
        move!(robot, side)
        motion_recursively_putmarker!(robot, side)
        move!(robot, inverse(side))
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) + 2)% 4)
