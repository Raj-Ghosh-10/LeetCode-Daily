class Solution {
    public int[][] sortMatrix(int[][] grid) {

        for (int i = 0; i < grid.length; i++) {
            int store[] = new int[grid.length - i];
            int cnt = 0;

            for (int j = 0; j < grid[0].length - i; j++) {
                store[cnt] = grid[i + cnt][j];
                cnt++;
            }

            Arrays.sort(store); 
            reverse(store);     

            cnt = 0;
            for (int j = 0; j < grid[0].length - i; j++) {
                grid[i + cnt][j] = store[cnt];
                cnt++;
            }
        }

        for (int i = 0; i < grid[0].length; i++) {
            int store[] = new int[grid.length - i - 1];
            int cnt = 0;

            for (int j = i + 1; j < grid.length; j++) {
                store[cnt] = grid[cnt][j];  
                cnt++;
            }

            Arrays.sort(store);
            cnt = 0;
            
            for (int j = i + 1; j < grid.length; j++) {
                grid[cnt][j] = store[cnt];
                cnt++;
            }
        }

        return grid;
    }

    private void reverse(int[] arr) {
        for (int i = 0; i < arr.length / 2; i++) {
            int temp = arr[i];
            arr[i] = arr[arr.length - 1 - i];
            arr[arr.length - 1 - i] = temp;
        }
    }
}