class Solution {
  String largestGoodInteger(String num) {
    List<String> value = ['999','888','777','666','555','444','333','222','111','000'];
    for(int i = 0 ; i < value.length ; i++){
        if(num.contains(value[i])){
            return value[i];
        }
    }
    return '';
  }
}