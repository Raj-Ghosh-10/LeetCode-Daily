/**
 * @param {number} n
 * @return {number}
 */
var soupServings = function(n) {
    if(n >= 4300){
        return 1
    }
    let memo = new Map()
    let helper = (a,b)=>{
        let key = `${a}-${b}`
        if(memo.has(key)){
            // console.log(1)
            return memo.get(key)
        }
        if(a <= 0 && b <= 0){
            return 0.5
        }
        if(a <= 0){
            return 1
        }
        if(b <= 0){
            return 0
        }
        let res = 0
        let count = 0
        let totalSoup = a + b
        while(totalSoup > 0){
            res+=helper(a-100 , b)
            res+=helper(a-75 , b - 25)
            res+=helper(a-25 , b - 75)
            res+=helper(a-50 , b - 50)
            count++
            totalSoup-=100
        }
        let x = 0.25 * (res/count)
        memo.set(key , x)
        return x
    }
    return helper(n , n)
    
};