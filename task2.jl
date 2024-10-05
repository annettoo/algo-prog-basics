#task 2

function perimetr!(robot)
    count_down = count_steps(robot, Sud)
    count_left = count_steps(robot, West)
    for side in (Ost, Nord, West, Sud)
        moveandmark!(robot,side)
    end
    back!(robot, count_down, count_left)

end

function count_steps(robot, side)
    k=0
    while isborder(robot,side) == false 
        move!(robot, side)
        k+=1
    end
    return k
end 

function moveandmark!(robot, side)
    while isborder(robot, side) == false
        move!(robot, side)
        putmarker!(robot)
    end
end