public class Solution {
    public int MaxTotalFruits(int[][] fruits, int startPos, int k) {
        int i = 0, j = 0;

        while(j < fruits.Length && fruits[j][0] <= startPos){
            j++;
        }

        i = j-1;
        int startPoint = i;
        int res = 0;

        res = Math.Max(MoveRightAndThenLeft(fruits, startPos, k, startPoint), MoveLeftAndThenRight(fruits, startPos, k, startPoint));
        

        return res;
    }

    private int MoveLeftAndThenRight(int[][] fruits, int startPos, int k, int startPoint){
        int i = startPoint, j = startPoint + 1;
        int current = 0, res = 0;

        while(j < fruits.Length && fruits[j][0] - startPos <= k){
            current += fruits[j++][1];
            res = Math.Max(current, res);
        }
        
        j--;

        while(i >= 0 && startPos - fruits[i][0] <= k){
            int reachableRightMost = fruits[i][0] + (k - (startPos - fruits[i][0]));

            while(j < fruits.Length && j > startPoint && fruits[j][0] > reachableRightMost){
                current -= fruits[j--][1];
            }

            current += fruits[i--][1];
            res = Math.Max(res, current);
        }

        return res;
    }

    private int MoveRightAndThenLeft(int[][] fruits, int startPos, int k, int startPoint){
        int i = startPoint, j = startPoint + 1;
        int current = 0, res = 0;

        while(i >= 0 && startPos - fruits[i][0] <= k){
            current += fruits[i--][1];
            res = Math.Max(current, res);
        }
        
        i++;
        // Console.WriteLine($"i={i}, j={j}, startPoint={startPoint}, current={current}");

        while(j < fruits.Length && fruits[j][0] - startPos <= k){
            int reachableLeftMost = fruits[j][0] - (k - (fruits[j][0] - startPos));

            while(i <= startPoint && fruits[i][0] < reachableLeftMost){
                current -= fruits[i++][1];
            }
            
            current += fruits[j++][1];
            // Console.WriteLine($"i={i}, j={j}, reachableLeftMost={reachableLeftMost}, current={current}, res={res}");
            res = Math.Max(res, current);
        }

        return res;
    }
}