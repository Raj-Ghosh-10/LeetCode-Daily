function isPowerOfTwo(n: number): boolean {
    for(let i=0; i<=32; i++){
        if(2**i === n){
            return true;
        }
        else
            continue;
    }
    return false;
};