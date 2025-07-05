/**
 * @param {number[]} arr
 * @return {number}
 */
var findLucky = function(arr) {
     let obj ={}
    let answer=0
 for(let i =0;i<arr.length;i++){
      obj[arr[i]] = obj[arr[i]]? obj[arr[i]]+1:1
        
 }
 
 for(let j in obj){
   if(j == obj[j]){
       if(answer<j){
        answer = obj[j]
       }
   }
 }
return answer ===0?-1:answer
};