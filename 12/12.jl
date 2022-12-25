using HorizonSideRobots

r = Robot("12.sit", animate = true)

function count_let(robot)
    counter = 0
    counter_check = 0
    counter_blank = 0
    counter_total = 0
    side = Ost
    while !isborder(robot, side)
        move!(robot, side)
        
        if isborder(robot, Nord)
            counter_blank = 0
            counter += 1;
            counter_check += 1
        elseif !isborder(robot, Nord) 
            counter_blank += 1
            if (counter_blank <= 1) 
                counter += 1;
                counter_check += 1
            else
                if (counter == 0 || counter_check == 0)
                    counter_total += 0
                else 
                    counter_total += counter / counter_check
                    counter = 0
                    counter_check = 0
                end
            end
        end

        if isborder(robot, side) && !isborder(robot, Nord)
            if (counter_blank <= 1)
                if (counter == 0 || counter_check == 0)
                    counter_total += 0
                else 
                    counter_total += counter / counter_check
                    counter = 0
                    counter_check = 0
                end
            end
            move!(robot, Nord)
            side = inverse(side)
            counter = 0
            counter_check = 0
        end
    end

    return counter_total
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)

count_let(r)