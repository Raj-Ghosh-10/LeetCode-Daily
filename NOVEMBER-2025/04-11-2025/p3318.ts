function findXSum(nums: number[], k: number, x: number): number[] {
    const n= nums.length;
    let ans= new Array(n - k + 1).fill(0);
    for(let i=0; i< n -k +1; i++){
        const sub= nums.slice(i, i+k);
        const map= new Map();
        for(const s of sub){
            map.set(s, (map.get(s)||0)+1);  
        }
        const arr= Array.from(map.entries()).sort((a, b)=>{
            if(a[1]==b[1]){
                return b[0] - a[0];
            }
            return b[1] - a[1];
        });
        if( arr.length < x){
            ans[i]= arr.reduce((a, b)=> a + b[0]* b[1], 0);

        }else{
            for(let j=0; j< x; j++){
                ans[i]+= arr[j][0]* arr[j][1];
            }
        }
       
    }
    return ans;
};