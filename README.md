# SudokuSolver
Solves All Sudoku Puzzles
Writen in MATLAB code

This is a depth first search algorithm for find the solution to sudoku
puzzles in matlab. It finds a hole, and tries to plug it with a number
from 1 to 9. if it sucessfully finds something that will fill the hole
in the puzzle it will move on to the next hole. If it can't find a
valid number to fill the hole with, it assumes one of its earlier
guesses was wrong and backtracks. It will go as far as possible along each
branch before backtracking to a previous assumption.

This algorithm works as long as the sudoku puzzle it was given is valid. 
It simply iterates through every permutation of the given puzzle
until it finds a valid solution with complete disregard for inteligent
strategy
