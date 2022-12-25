using HorizonSideRobots

r = Robot(15, 15,  animate = true)

function cross_corner(r::Robot)
    while !isborder(r,HorizonSide(3))
        putmarker!(r)
        move!(r,HorizonSide(3))
        move!(r,HorizonSide(0))
    end

    putmarker!(r)

    while !isborder(r,HorizonSide(2))
        move!(r,HorizonSide(2))
    end

    putmarker!(r)
    
    while !isborder(r,HorizonSide(1))
        move!(r,HorizonSide(1))
        move!(r,HorizonSide(0))
        putmarker!(r)
    end

end

cross_corner(r)