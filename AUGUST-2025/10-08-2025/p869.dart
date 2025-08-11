class Solution {
  bool reorderedPowerOf2(int n) {
    final twos = <String>[];
    var num = 1;
    twos.add((num.toString().split('')..sort()).join());
    while (num <= 1000000000) {
      num <<= 1;
      twos.add((num.toString().split('')..sort()).join());
    }

    final sortedN = (n.toString().split('')..sort()).join();
    return twos.contains(sortedN);
  }
}