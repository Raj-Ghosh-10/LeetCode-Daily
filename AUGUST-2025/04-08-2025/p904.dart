import 'dart:math';

typedef FruitCount = Map<int, int>;

class Solution {
  int totalFruit(List<int> fruits) {
    final baskets = FruitCount();
    int maxFruit = 0;

    int left = 0;

    for (int right = 0; right < fruits.length; right++) {
      // Add fruit from the [right] side of the window into [baskets]
      baskets.update(fruits[right], (count) => count + 1, ifAbsent: () => 1);
        
      // If we have more than 2 baskets we need to shift the [left] until it's <= 2 again.
      while (baskets.keys.length > 2) {
        baskets.update(fruits[left], (count) => count - 1);
        // Once there's no more a particular fruit we can remove the key/basket
        if (baskets.containsKey(fruits[left]) && baskets[fruits[left]]! <= 0) {
          baskets.remove(fruits[left]);
        }
        left++;
      }
      
      maxFruit = max(maxFruit, baskets.values.sum);
    }

    return maxFruit;
  }
}

extension on Iterable<int> {
  get sum => fold(0, (prevCount, count) => prevCount + count);
}