impl Solution {
    pub fn count_operations(mut num1: i32, mut num2: i32) -> i32 {
        let mut o = 0;
        while num1!=0 && num2!= 0 {
            if num1>=num2{
                num1-=num2
            }else{
                num2-=num1
            }
            o+=1;
        }

        return o;
    }
}