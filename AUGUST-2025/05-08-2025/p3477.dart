class Solution {
  int numOfUnplacedFruits(List<int> fruits, List<int> baskets) {
    List<int>bas=[...baskets];
    for(int i=0;i<fruits.length;i++){
      for(int j=0;j<bas.length;j++){
        if(fruits[i]<=bas[j]){
            bas.removeAt(j);
            break;
        }
      }
    }
    return bas.length;
  }
}