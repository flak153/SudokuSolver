function sudoku ()
puzzle = importdata(input('Which sudoku puzzle shall we solve today? ','s')); % enter your filename without quotes
if invalid(puzzle)
elseif ~sudokuMainLoop(puzzle) %the MainLoop returns 0 if the puzzle has no solutions
    disp('puzzle has no solutions')
else
fprintf('The solution to your puzzle is: \n') 
disp(sudokuMainLoop(puzzle));
end
end


function [ output ] = sudokuMainLoop( A )
%solves sudoku puzzles
%       This is a depth first search algorithm for find the solution to sudoku
%   puzzles in matlab. It finds a hole, and tries to plug it with a number
%   from 1 to 9. if it sucessfully finds something that will fill the hole
%   in the puzzle it will move on to the next hole. If it can't find a
%   valid number to fill the hole with, it assumes one of its earlier
%   guesses was wrong and backtracks. It will go as far as possible along each
%   branch before backtracking to a previous assumption.

%       This algorithm works as long as the sudoku puzzle it was given is valid. 
%   It simply iterates through every permutation of the given puzzle
%   until it finds a valid solution with complete disregard for inteligent
%   strategy
%
%       WARNING: this algorithm is CRAZY FAST. You might not believe the
%       speed at which this thing solves difficult puzzles

for box = 1:81 %since it doesn't matter which order we plug holes in the puzzle I used a single loop that goes through all 81 boxes
    if A(box) == 0
        for int = 1:9
            if boxCheck(A, box, int)
                continue
            end
            B = A;
            B(box) = int; 
            %disp(B) %comment this to suppress printout
            %pause(.5) %uncomment for a better veiw of how this works
            C = sudokuMainLoop(B); 
            if C == 0; %sudoku() returns 0s if the function it was passed was either invalid or a hole couldn't be filled
                continue
            else
                output = C; %only valid solutions return a matrix
                return
            end
        end
        output = 0; %only runs if the function tried to fill a hole with every int and failed
        return
    end
end
output = A; %only runs if the matrix passed to the function is valid and has no holes(aka solved)
end


