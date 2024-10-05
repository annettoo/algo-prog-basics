#task 3

using HorizonSideRobots

function vsepole!(robot)
    count_down = count_steps(robot, Sud)
    count_left = count_steps(robot, West)
    movement_mark!(robot)
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

function movement_mark!(robot)
    putmarker!(robot)
    while isborder(robot, Nord)==false
        for side in (Ost, West)
            putmarker!(robot)
            moveandmark!(robot, side)
            if isborder(robot, side)==true
                putmarker!(robot)
                move!(robot, Nord)
            end
        end
    end
    if isborder(robot, Nord)==true
        for side in (Ost, West)
            putmarker!(robot)
            moveandmark!(robot, side)
        end
    end
end

function back!(robot, count_down, count_left)
  while isborder(robot, Sud)==false
    move!(robot, Sud)
  end 
  while isborder(robot, West)==false
    move!(robot, West)
  end 
  for i in 1:count_down
    move!(robot, Nord)
    end
    for i in 1:count_left
        move!(robot, Ost)
    end
end  


                
