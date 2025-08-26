class Solution {
    public int areaOfMaxDiagonal(int[][] dimensions) {
        int maxDigArea = 0;
        int maxArea = 0;

        for(int i =0; i<dimensions.length; i++){
            int length = dimensions[i][0];
            int width = dimensions[i][1];
            int digonal = length * length + width * width;
            int area = length * width;

            if(digonal > maxDigArea){
                maxDigArea = digonal;
                maxArea = area;
            }
            else if(digonal == maxDigArea){
                maxArea = Math.max(maxArea, area);
            }
        }

        return maxArea;
    }
}