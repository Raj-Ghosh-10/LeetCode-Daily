class Solution {
public:

    bool isSafe(vector<vector<char>> &board, int row, int col, char digit) {
        //horzontal
        for(int i=0; i<9; i++) {
            if(board[row][i] == (digit)) {
                return false;
            }
        }
        //vertical
        for(int i=0; i<9; i++) {
            if(board[i][col] == (digit)) {
                return false;
            }
        }
        //square
        int sRow = (row/3)*3;
        int sCol = (col/3)*3;

        for(int i = sRow; i<sRow+3; i++) {
            for(int j=sCol; j<sCol+3; j++) {
                if(board[i][j] == (digit)) {
                    return false;
                }
            }
        }

        return true;
    }


    bool helper(vector<vector<char>> &board, int row, int col) {
        //base case;
        if(row == 9) {
            return true;
        }


        int newRow = row;
        int newCol = col+1;

        if(newCol == 9) {
            newRow++;
            newCol = 0;
        }

        if(board[row][col] != '.') {
            return helper(board, newRow, newCol);
        }

        for(char digit = '1'; digit<='9'; digit++) {
            if(isSafe(board, row, col, digit)) {
                board[row][col] = digit;
                if(helper(board, newRow, newCol)) {
                    return true;
                }
                board[row][col] = '.';
            }
        }
        return false;

    }


    void solveSudoku(vector<vector<char>>& board) {
        helper(board, 0, 0);
    }
};