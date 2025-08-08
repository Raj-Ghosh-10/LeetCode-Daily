class Solution {
  double soupServings(int n) {

    var units = (n + 25 - 1) ~/ 25;
    
    if (units > 1000) return 1.0;

    final memo = List.generate(units + 1, (_) => List.filled(units + 1, -1.0));

    double solve(int type_a, int type_b) {
      if (type_a <= 0 && type_b <= 0) return 0.5;
      if (type_a <= 0) return 1.0;
      if (type_b <= 0) return 0.0;

      if (memo[type_a][type_b] < 0.0) {
        memo[type_a][type_b] =
        (solve(type_a - 4, type_b)
        +solve(type_a - 3, type_b - 1)
            +solve(type_a - 2, type_b-2)
            +solve(type_a - 1, type_b-3)
        ) * 0.25;
      }
      return memo[type_a][type_b];
    }

    return solve(units, units);

  }
}