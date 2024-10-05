using HorizonSideRobots

function kross!(robot)
    for side in (Nord, Ost, Sud, West)
        num_steps = mark_direct!(robot, side)
        side = inverse(side)
        move!(robot, side, num_steps)
    end
end

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side) #двинаем робота столько раз, сколько поставили марок
    end
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4) #изначально для сторон с севера по часовой коэфы 0,1,2,3

function mark_direct!(robot, side)
    n::Int = 0 # :: после них ставится тип данных, тут int
    while ! isborder(robot, side) #пока не = while !
        move!(robot, side)
        putmarker!(robot)
        n+=1
    end
    return n
end
