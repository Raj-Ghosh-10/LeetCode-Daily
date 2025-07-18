
class Solution {
    public long minimumDifference(int[] nums) {
        int x = nums.length;
        int n = x / 3;
        long part1[] = new long[n + 1];
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
        long sum = 0;
        for(int i = 0;i < n;i++){
            sum += nums[i];
            maxHeap.add(nums[i]);
        }
        part1[0] = sum;
        for(int i = n;i < 2 * n;i++){
            sum += nums[i];
            maxHeap.add(nums[i]);
            sum -= maxHeap.poll();
            part1[i - (n - 1)] = sum; // To get indices from 1
        }
        long part2 = 0;
        PriorityQueue<Integer> minHeap = new PriorityQueue<>();
        for(int i = x - 1;i >= 2 * n;i--){
            part2 += nums[i];
            minHeap.add(nums[i]);
        }
        long minDiff = part1[n] - part2;
        for(int i = 2 * n - 1;i >= n;i--){
            part2 += nums[i];
            minHeap.add(nums[i]);
            part2 -= minHeap.poll();
            minDiff = Math.min(minDiff, part1[i - n] - part2);
        }
        return minDiff;
    }
}