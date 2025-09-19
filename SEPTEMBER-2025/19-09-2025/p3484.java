class Spreadsheet {

 int grid [][];
    public Spreadsheet(int rows) {
        grid = new int[rows][26];
        for(int i=0; i<rows; i++){
            for(int j=0; j<26; j++ ){
                grid[i][j] =0;
            }
        }
        
    }
    
    public void setCell(String cell, int value) {

        int col = cell.charAt(0) - 'A';
        int row = Integer.parseInt(cell.substring(1))-1;
        grid[row][col] = value;

        
    }
    
    public void resetCell(String cell) {
        int col = cell.charAt(0) - 'A';
        int row = Integer.parseInt(cell.substring(1))-1;
        grid[row][col] = 0;

        
    }
    
    public int getValue(String formula) {

        formula = formula.substring(1).replace(" " , "");
        int sum=0;

        String [] parts = formula.split("\\+");
        for(String part : parts){

            if(Character.isLetter(part.charAt(0))){

                int col = part.charAt(0)-'A';
                int row =  Integer.parseInt(part.substring(1))-1;

                sum += grid[row][col];
                 
            }
            else{
                sum += Integer.parseInt(part);
            }
        }
        return sum;

        
    }
}

/**
 * Your Spreadsheet object will be instantiated and called as such:
 * Spreadsheet obj = new Spreadsheet(rows);
 * obj.setCell(cell,value);
 * obj.resetCell(cell);
 * int param_3 = obj.getValue(formula);
 */