/**
 * @param {string} word
 * @return {boolean}
 */
var isValid = function(word) {
    if(word.length<3) return false;
    let digit = 0;
    let vowel = 0;
    let cons = 0;
    for(let letter of word){
        if(/^[a-z0-9]$/i.test(letter)){
            if(/\d/.test(letter)){
                digit++;
            }else if(['a','e','i','o','u'].includes(letter.toLowerCase())){
                vowel++;
            }else{
                cons++;
            }
        }else{
            return false
        }
    }

    if(vowel>=1 && cons>=1){
        return true;
    }else{
        return false;
    }

};