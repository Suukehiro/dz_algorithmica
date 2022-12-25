using HorizonSideRobots

function motion_recursively(robot::Robot, side::HorizonSide)
    if !isborder(robot, side)
        move!(robot, side)
        motion_recursively!(robot, side)
    end
end

