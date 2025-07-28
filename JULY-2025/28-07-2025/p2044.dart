class Solution {
  int countMaxOrSubsets(List<int> nums) {
       int maxOr = 0;
    int count = 0;
    
    // Step 1: Compute the maximum OR possible with the entire array
    for (int num in nums) {
      maxOr |= num;
    }

    // Step 2: Use backtracking to find all subsets that achieve this maximum OR
    void backtrack(int currentOr, int index) {
      if (index == nums.length) {
        // If we've reached the end of the array, check if the current OR matches the maximum OR
        if (currentOr == maxOr) {
          count++;
        }
        return;
      }
      
      // Include the current element in the subset
      backtrack(currentOr | nums[index], index + 1);
      
      // Exclude the current element from the subset
      backtrack(currentOr, index + 1);
    }

    // Step 3: Start backtracking from index 0 with an initial OR of 0
    backtrack(0, 0);
    
    return count;
  }
}