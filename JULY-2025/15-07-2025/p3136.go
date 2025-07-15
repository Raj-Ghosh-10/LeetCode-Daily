func isValid(word string) bool {
    if len(word) < 3 {
        return false
    }

    var vowExist,consExist bool

    for _,l := range word {
        if (l > 47 && l < 58) || (l > 64 && l < 91) || (l > 96 && l < 123) {
            if vowelMap[l]{
                vowExist = true
            }else if l > 58 {
                consExist = true
            }
        }else{
            return false
        }
    }
    return vowExist && consExist
}


var vowelMap = map[rune]bool{
    'i' : true,
    'o': true,
    'a' : true,
    'e' : true,
    'u' : true,
  'I' : true,
    'O': true,
    'A' : true,
    'E' : true,
    'U' : true,
}