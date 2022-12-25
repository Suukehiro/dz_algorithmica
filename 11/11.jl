using HorizonSideRobots

r = Robot("11.sit", animate = true)

function count_partitions(robot)
    counter = 0
    counter_check = 0
    counter_total = 0
    side = Ost
    
    while !isborder(robot, side)
        move!(robot, side)

        if isborder(robot, Nord)
            counter += 1;
            counter_check += 1
        else 
            if count == 0 || counter_check == 0
                counter_total += 0
            else 
                counter_total += counter / counter_check
                counter = 0
                counter_check = 0
            end
        end
        if isborder(robot, side) && !isborder(robot, Nord)
            move!(robot, Nord)
            side = inverse(side)
            counter = 0
            counter_check = 0
        end
    end
    return counter_total
end

inverse(side::HorizonSide) = HorizonSide((Int(side) + 2) % 4)

count_partitions(r)