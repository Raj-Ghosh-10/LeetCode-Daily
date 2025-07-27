# @param {Integer[]} nums
# @return {Integer}
def count_hill_valley(nums)
    hills, valley = 0, 0
    nums.each_with_index do |num, index|
        # Skip first and last as they are neither hill or valley
        if index == 0 || index == nums.length - 1
            next
        end

        # Go to last iteration of repeating character.
        if index + 1 < nums.length && nums[index] == nums[index + 1]
            next
        end

        # Go left to check for valley or hill
        left, right = index - 1, index + 1
        
        while left > 0 && nums[index] == nums[left]
            left -= 1
        end

        # Check for valley and hills
        valley = valley + 1 if nums[index] < nums[left] && nums[index] < nums[right]
        hills = hills + 1 if nums[index] > nums[left] && nums[index] > nums[right]
    end
    return valley + hills
end