function [ output ] = boxCheck( A, box, int )
%Checks if a sudoku puzzle is valid or not
%   Checks a sudoku puzzle ineger by integer, column by column, row by row,
%   and finally block by block looking for duplicates and immediatley
%   returns 0 if it finds any
column = ceil(box/9);
row = box - (column-1) * 9;
for proxy = 1:9; %this iterates through columns when searching rows and through rows when searching columns
    if A(proxy, column) == int  
        output = 1;
        return        
    end
    if A(row, proxy) == int        
        output = 1;
        return        
    end
end
boxCenter = [2 5 8];
boxCenterX = ceil(column/3);
boxCenterY = ceil(row/3);
for deltaX = -1:1
    for deltaY = -1:1
        if A(boxCenter(boxCenterY)+deltaY,boxCenter(boxCenterX)+deltaX) == int   
            output = 1;
            return
        end
    end
end
output = 0;
return
end
