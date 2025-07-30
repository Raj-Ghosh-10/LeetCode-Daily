impl Solution {
    pub fn longest_subarray(nums: Vec<i32>) -> i32 {
        let n=nums.len();
        let mut maxEl=nums[0].clone();
        let mut cnt=0;
        let mut mCnt=0;
        for i in 0..n {
            if (maxEl<nums[i]) {
                maxEl=nums[i];
                cnt=0;
                mCnt=0;
            }
            if (maxEl==nums[i]) {
                cnt+=1;
                mCnt= mCnt.max(cnt);
            }else{
                cnt=0;
            }

        } mCnt
    }
}