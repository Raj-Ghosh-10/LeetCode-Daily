public class Solution {
    public long MinimumDifference(int[] nums) {
        int len3=nums.Length, len1=len3/3, len2=len1*2, stackPtr=0, i=0, num;
        Span<long> stack=stackalloc long[len1+1]; // used to remember min sums
        PriorityQueue<int, int> heap=new(len1); // used for min and max heaps
        long sum=0, min;
        // Step 1: min heapify left
        for(; i<len1; sum+=num)
            heap.Enqueue(num=nums[i++], -num);
        // Step 2: push min sum as we min heapify middle
        for(stack[stackPtr++]=sum; i<len2; stack[stackPtr++]=sum)
            if((num=nums[i++])<heap.Peek())
                sum+=num-heap.DequeueEnqueue(num, -num);
        // Step 3: max heapify right
        heap.Clear();
        for(sum=0; i<len3; sum+=num)
            heap.Enqueue(num=nums[i++], num);
        // Step 4: subtract max sum from popped min sum as we max heapify middle
        for(min=stack[--stackPtr]-sum, i=len2; i>len1; min=Math.Min(min, stack[--stackPtr]-sum))
            if((num=nums[--i])>heap.Peek())
                sum+=num-heap.DequeueEnqueue(num, num);
        return min;
    }
}