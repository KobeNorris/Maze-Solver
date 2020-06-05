function [Start_X, Start_Y, Destination_X, Destination_Y] = AStarStart(maze)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   This function takes the maze matrix then returns three unique point:
%   original point, start point and destinantion point.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[mazerow, mazecol] = size(maze);
index = 0;
for temp = maze (mazerow, 1 : mazecol)
    if temp == 3
        break;
    else
        index = index + 1;
    end
end
Start_X = mazerow - 1;
Start_Y = index + 1; % Route starts from this point.
index = 0;
for temp = maze (1, 1 : mazecol)
    if temp == 4
        break;
    else
        index = index + 1;
    end
end
Destination_X = 1;
Destination_Y = index + 1; % Route ends in this point.