%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal path: starting from the last node, backtrack to
% its parent nodes until it reaches the start node
% 04-26-2005    Copyright 2009-2010 The MathWorks, Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Optimal_path = [];
% xval = QUEUE(Nodn, 2);
% yval = QUEUE(Nodn, 3);

Tpc = 0;
None = 0;
Nond = size(QUEUE, 1);

for temp = 1:QUEUE_COUNT
    if(QUEUE(temp, 1) == 0)
        None = None + 1;
    end
end

temp = Nond;         
while(QUEUE(temp, 1) == 1)
    temp = temp - 1;
end

maze(QUEUE(index_min_node, 2), QUEUE(index_min_node, 3)) = 4;
dispMaze(maze);

while(temp ~= 1)
    Tpc = Tpc + 1;
    xParent = QUEUE(temp, 4);
    yParent = QUEUE(temp, 5);
    for index = 1:Nond
        if(QUEUE(index, 2) == QUEUE(temp, 4) && QUEUE(index, 3) == yParent)
            temp = index;
            maze(QUEUE(temp, 2), QUEUE(temp, 3)) = 5;
            dispMaze(maze);
            break;
        end
    end
end
Tpc = Tpc + 1;

% i = 1;
% Optimal_path(i, 1) = xval;
% Optimal_path(i, 2) = yval;

% if ((xval == xTarget) && (yval == yTarget))
%     inode = 0;
%     % Traverse QUEUE and determine the parent nodes
%     parent_x = QUEUE(index(QUEUE, xval, yval), 4);
%     parent_y = QUEUE(index(QUEUE, xval, yval), 5);
%    
%     while(parent_x ~= xStart || parent_y ~= yStart)
%         i = i + 1;
%         Optimal_path(i, 1) = parent_x; % store nodes on the optimal path
%         Optimal_path(i, 2) = parent_y;
%         inode = index(QUEUE, parent_x, parent_y); % find the grandparents :)
%         parent_x = QUEUE(inode, 4);
%         parent_y = QUEUE(inode, 5);
%     end
%     Optimal_path(i+1,1) = xStart;    % add start node to the optimal path  
%     Optimal_path(i+1,2) = yStart;
% 
%     j = size(Optimal_path, 1);
%     p = plot(Optimal_path(j, 1) + .5, Optimal_path(j, 2) + .5, 'bo'); % plot target
%     j = j - 1;
%     for i = j : -1 : 1 % show the path
%         pause(.25);
%         set(p, 'XData', Optimal_path(i, 1) + .5, 'YData', Optimal_path(i, 2) + .5);
%         drawnow;
%     end;
% 
%     plot(Optimal_path(:, 1) + .5, Optimal_path(:, 2) + .5); % plot the optimal path
% else
%     pause(1);
%     h = msgbox('Oops! No path exists to the Target!', 'warn');
%     uiwait(h, 5);
% end