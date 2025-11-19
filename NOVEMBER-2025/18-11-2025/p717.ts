function isOneBitCharacter(bits: number[]): boolean {
    for(let i = 0; i < bits.length; i++){
        if(i == bits.length-1) return true;
        if(bits[i] == 1) i++;
    }
    return false
};