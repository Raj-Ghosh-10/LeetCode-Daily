/**
 * @param {number} k
 * @return {character}
 */
var kthCharacter = function(k) {

    const chars = 'abcdefghijklmnopqrtuvwxyz';
    
    function get2Power(num1, num2=1){
        if(num1 <= 1) return 0;
        if(num1 <= num2 * 2) return num2;
        return get2Power(num1, num2*2);
    }

    function getAns(k) {
        if(k === 1) return 0;
       
        const min2Power = get2Power(k);
        const diff = k - min2Power;

        if(diff === 0) return chars[min2Power];

        return 1 + getAns(diff);
    }

    const index = getAns(k) % chars.length;

    return chars[index];
};