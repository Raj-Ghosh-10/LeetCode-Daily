class Spreadsheet {
public:
    // o(rows*26)
    vector<vector<int>>grid;
    Spreadsheet(int rows) {
        //o(rows*26)
        grid.assign(rows + 1, vector<int>(26, 0));

    }
    
    void setCell(string cell, int value) {
        //o(len(cell)) = o(5)
        int col = cell[0]-'A';
        int row = stoi(cell.substr(1));
        grid[row-1][col] = value;
    }
    
    void resetCell(string cell) {
        // o(cell.length) = o(5) max possible length as rows value = 1000
        int col = cell[0]-'A';
        int row = stoi(cell.substr(1));
        grid[row-1][col] = 0;
    }
    
    int getValue(string formula) {
        //o(16)
        string X ;
        string Y;
        int i = 1;
        int n = formula.length();
        while(i<n){
            if(formula[i] == '+'){
                break;
            }
            X += formula[i];
            i++;
        }
        i = i+1;
        Y = formula.substr(i);
        int a,b;
        if(isalpha(X[0])){
            int col = X[0]-'A';
            int row = stoi(X.substr(1));
            if(row<0 || row>=grid.size()){
                a = 0;
            }
            else{
                a = grid[row-1][col];
            }
        }
        else {
            a = stoi(X);
        }
        if(isalpha(Y[0])){
            int col = Y[0]-'A';
            int row = stoi(Y.substr(1));
            if(row<0 || row>=grid.size()){
                b = 0;
            }
            else{
                b = grid[row-1][col];
            }
        }
        else{
            b = stoi(Y);
        }
        return a+b;

    }
};

/**
 * Your Spreadsheet object will be instantiated and called as such:
 * Spreadsheet* obj = new Spreadsheet(rows);
 * obj->setCell(cell,value);
 * obj->resetCell(cell);
 * int param_3 = obj->getValue(formula);
 */