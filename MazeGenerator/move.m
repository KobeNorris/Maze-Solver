function [maze, position, nodes] = move(maze, position, nodes, difficulty)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description
%	This function his function takes a maze and generates one new point along its current path. This function is
%   recursively called within the main function until there are zero nodes. This function first calls validateMove to
%   get a list of possible directions the function can go. If there are 0 possible directions and the current position
%   is a node, the node is removed and the current position is set to the last node on the list. If there are 0 possible
%   directions and the current position is not a node, the current position is set to the last node on the list. If
%   there are 1, 2, 3, or 4 possible directions, the function does a couple of things. It first finds a random direction
%   using the weighting described in the movement section of this README. It then finds the position of the previous
%   position (whatever point was created just before this one). It then calls the checkNodes function. If it returns
%   true, then add the current point to the node list. Regardless, the currentPoint is set equal to the futurePoint and
%   that point in the maze is set to 1. maze, pos, and nodes are all returned in order to make this function easy to be
%   called recursively.
%
% Function Call
%   function [maze, position, nodes] = move(maze, position)
%
% Input Arguments
%	1. maze: Current maze
%   2. position: Current position
%   3. nodes: Current list of nodes
%   4. difficulty: User-defined difficulty (1 low, 10 high)
%
% Output Arguments
%	1. maze: Updated maze
%   2. position: Updated position
%   3. nodes: Updated list of nodes
%
% Assignment Information
%	Assignment:         MATLAB Individual Project
%	Author:             Ryan Schwartz, schwar95@purdue.edu
%  	Team ID:            001-07
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
% directions = [up, down, left, right]
% up, down, left, right can be 1 for OK or 0 for NO
[directions] = validateMove(maze, position);

%% CALCULATIONS ---
% Check if that route can continue or not
if any(directions) == 0                         % if all of them are 0
    if same(position, nodes) == 1               % If we did not move this turn
        % Remove last node because all positions are exhausted
        nodes = nodes(:, 1 : end - 1);          % Remove the last node
    else
        position = point(nodes(1, end), nodes(2, end)); % Jump back to the last node
    end
else
    % sum(directions) = 1, 2, 3 which means we have at least one choice
    % Random direction
    locations = directions .* floor(100.0/sum(directions)); % Evenly divided 100 into 1 to 3 parts
    % Adusts difficulty
    % Increase in upward tendency if difficulty is 1
    locations(1) = locations(1) * (1 - ((difficulty - 5.0)/14)); % diff ranges from 1 to 10, - 5 then divided by 14, then plus 1
    locations(2) = locations(2) * (1 + ((difficulty - 5.0)/14));
    locations(3) = locations(3) * (1 + ((difficulty - 5.0)/14));
    locations(4) = locations(4) * (1 + ((difficulty - 5.0)/14));
    if sum(locations) ~= 100 % Only when the diff == 5
        for k = 1:4
            if directions(k) == 1
                locations(k) = locations(k) + 100 - sum(locations); % locations(k) equals 100 - the other locations 
            end
        end
    end
    % Choose random direction
    r = randi([1 100]);
    if r <= locations(1) % 难度越高， 越不可能 , if direction is 0 can not happen
        futurePosition = point(position.row - 1, position.col); % move to the lower row
    elseif r <= locations(2) + locations(1) % If direction is 0 can not happen
        futurePosition = point(position.row + 1, position.col); % move to the higher row
    elseif r <= locations(3) + locations(2) + locations(1) % If direction is 0 can not happen
        futurePosition = point(position.row, position.col - 1); % move to higher lower col
    else % If direction is 0 can not happen
        futurePosition = point(position.row, position.col + 1); % move to the higher col
    end
    
    % Find previous number 1
    if mazeValue(maze, position, -1, 0) == 1 % If the lower row position in maze is path
        previousPosition = point(position.row - 1, position.col);
    elseif mazeValue(maze, position, 1, 0) == 1 % If the higher row position in maze is path
        previousPosition = point(position.row + 1, position.col);
    elseif mazeValue(maze, position, 0, -1) == 1 % If the lower col position in maze is path
        previousPosition = point(position.row , position.col - 1);
    else % mazeValue(maze, position, 0, 1) == 1 % If the higher col position in maze is path
        previousPosition = point(position.row, position.col + 1);
    end

    % Check if node created
    if checkNode(futurePosition, previousPosition) == 1
        nodes(1, end + 1) = position.row;
        nodes(2, end) = position.col;
    end

    position = futurePosition;
    maze = setMazePosition(maze, position, 1); % Creat a Path on the position
end

%% FORMATTED TEXT & FIGURE DISPLAYS ---


%% COMMAND WINDOW OUTPUTS ---


%% ACADEMIC INTEGRITY STATEMENT ---
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%

