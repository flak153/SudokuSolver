function [ output ] = invalid( A )
%Checks if a sudoku puzzle is valid or not
%   Checks a sudoku puzzle ineger by integer, column by column, row by row,
%   and finally block by block looking for duplicates and immediatley
%   returns 0 if it finds any
[y,x] = size(A);
if (x > 9 | y > 9)
    disp('your matrix dimensions are wrong')
    output = 1;
    return
end
for int = 1:9;
    for proxy = 1:9; %this iterates through columns when searching rows and through rows when searching columns
        occurences = 0; % number of times the function sees the integer in question in the coulumn in question
        for col = 1:9;
            if A(proxy,col) == int
                occurences = occurences + 1;
                if occurences > 1
                    fprintf('the value at (%i,%i) conflicts with something in column %i',proxy,col,col)
                    output = 1;
                    return
                end
            end
        end
        instances = 0;
        for row = 1:9;
            if A(row, proxy) == int
                instances = instances + 1;
                if instances > 1
                    fprintf('the value at (%i,%i) conflicts with something in row %i',row,proxy,row)
                    output = 1;
                    return;
                end
            end
        end
    end
    blockCenter = [2 5 8]; %the center coordinates of sudoku puzzle blocks are some combination of these three ints
    for blockCenterX = 1:3  %this bloack of code checks through each block of the sudoku puzzle
        for blockCenterY = 1:3 
            incidents = 0;
            for deltaX = -1:1 
                for deltaY = -1:1
                    if A(blockCenter(blockCenterX)+deltaX,blockCenter(blockCenterY)+deltaY) == int
                        incidents = incidents + 1;
                        if incidents > 1
                            fprintf('the value at (%i,%i) conflicts with something in its block',blockCenter(blockCenterX)+deltaX,blockCenter(blockCenterY)+deltaY)
                            output = 1;
                            return
                        end
                    end
                end
            end
        end
    end
    output = 0;
end
end
