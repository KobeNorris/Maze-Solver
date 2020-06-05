function [directions] = validateMove(maze, position)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description
%	This function telsl the move function where the current position could
%   possibly go. This function will return a matrix called directions that
%   will return either a 1 or a 0 for each direction. The format for
%   directions is up, down, left, right. Valid movements are checked using
%   a valid movement matrix outlined on GitHub.
%
% Function Call
%   function [positions] = validateMove(maze, position)
%
% Input Arguments
%	1. maze: Current maze
%   2. position: Current position
%
% Output Arguments
%	1. positions: Matrix that shows what available directions can be used.
%	Formatted in [up down left right], where 1's are viable movements.
%
% Assignment Information
%	Assignment:         MATLAB Individual Project
%	Author:             Ryan Schwartz, schwar95@purdue.edu
%  	Team ID:            001-07
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
directions = [1 1 1 1]; % Up, down, left, right
[numrow, numcol] = size(maze);  % Put maze's row number and column number into an array

%% CALCULATIONS ---
% Check up
if position.row == 2
    directions(1) = 0;       % If we are in the 2nd row ??? 图错了 ??? , set up to 0
elseif position.row == 3    % If we are in the 3rd row
    for z = [-1 0 1]        % Check the 3 blocks below present node
        if mazeValue(maze, position, -1, z) == 1    % If there is 3 Paths below (-1)
            directions(1) = 0;                       % Set up to 0
        end
    end
else                        % If we are not in 2nd or 3rd row
    for k = [-2 -1]         % k from -2 to -1% Set up to 0 , 你干嘛啊？
        for z = [-1 0 1]    % z from -1, 0, 1
            if mazeValue(maze, position, k, z) == 1 % If there is 3*2 Paths below (-1 -2)
                directions(1) = 0;                   % Set up to 0
            end
        end
    end
end

% Check down
if position.row == numrow - 1               % If we are in the size - 1 row ??? 图错了 ??? , set down to 0
    directions(2) = 0;
elseif position.row == numrow - 2           % If we are in the size - 2 row
    for z = [-1 0 1]
        if mazeValue(maze, position, 1, z) == 1     % If there is 3 Paths above (1)
            directions(2) = 0;                       % Set down to 0
        end
    end
else
    for k = [1 2]
        for z = [-1 0 1]
            if mazeValue(maze, position, k, z) == 1     % If there is 3*2 Paths above (1 2)
                directions(2) = 0;                       % Set down to 0
            end
        end
    end
end

% Check left
if position.col == 2                        % If we are on the 2nd column
    directions(3) = 0;
elseif position.col == 3                    % If we are in the 3rd column
    for z = [-1 0 1]
        if mazeValue(maze, position, z, -1) ==1     % If there is 3 Paths on the left (-1)
            directions(3) = 0;                       % Set left to 0
        end
    end
else
    for k = [-1 0 1]
        for z = [-2 -1]
            if mazeValue(maze, position, k, z) == 1    % If there is 3*2 Paths on the left (-1)
                directions(3) = 0;                      % Set left to 0
            end
        end
    end
end

% Check right
if position.col == numcol - 1               % If we are on the size - 2 column
    directions(4) = 0;
elseif position.col == numcol - 2           % If we are in the size - 3 column
    for z = [-1 0 1]
        if mazeValue(maze, position, z, 1) == 1     % If there is 3 Paths on the right （1)
            directions(4) = 0;                       % Set right to 0
        end
    end
else
    for k = [-1 0 1]
        for z = [1 2]
            if mazeValue(maze, position, k, z) == 1     % If there is 3*2 Paths on the right (1)
                directions(4) = 0;                       % Set right to 0 , 又正常啦
            end
        end
    end
end

%% FORMATTED TEXT & FIGURE DISPLAYS ---

%% COMMAND WINDOW OUTPUTS ---


%% ACADEMIC INTEGRITY STATEMENT ---
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%

