using HorizonSideRobots

r = Robot("5.sit"; animate = true)

function build(r::Robot)
    side = 3
    while !(isborder(r,HorizonSide(2)) == true && side == 2)
        if !isborder(r,HorizonSide(side))
            putmarker!(r)
            move!(r,HorizonSide(side))
        elseif (side == 3)
            side = 0
        elseif (side == 0)
            side = 1
        elseif (side == 1)
            side = 2
        end
    end
end

function search_isFrame()
    count = 0
    side = 0
    while true
        if !isborder(r,HorizonSide(side))
            move!(r,HorizonSide(side))
            count += 1
        elseif (count == 14)
            count = 0
            move!(r,HorizonSide(3))
        if side == 0
            side = 2
        else side == 2
            side = 0
        end
        elseif (count != 14)
            break
        end
    end
end

function paint_next_side()
    side = 1
    side_two = 0
    while true
        if isborder(r,HorizonSide(0))
            side_two = 0
            putmarker!(r)
            move!(r, HorizonSide(3))
        end
        if isborder(r, HorizonSide(3))
            side_two = 3
            putmarker!(r)
            move!(r, HorizonSide(2))
        end
        if isborder(r,HorizonSide(2))
            side_two = 2
            putmarker!(r)
            move!(r, HorizonSide(1))
        end
        if isborder(r, HorizonSide(1))
            side_two = 1
            putmarker!(r)
            move!(r,HorizonSide(0))
        end
        if ((!isborder(r,HorizonSide(0))) && (!isborder(r,HorizonSide(1))) && (!isborder(r,HorizonSide(2))) && (!isborder(r,HorizonSide(3))))
            putmarker!(r)
            move!(r, HorizonSide(side_two))
        end
        if ismarker(r)
            break
        end

    end
end

build(r)
search_isFrame()
paint_next_side()