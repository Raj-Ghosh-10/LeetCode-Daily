import 'dart:math'; // Required for min and max functions

class Solution {
  // Declare and initialize 3D lists (equivalent to 3D arrays in Java).
  // All elements are initialized to 0. The Java code uses 0 to indicate
  // an uncomputed state, so this initialization is consistent.
  List<List<List<int>>> F = List.generate(
    30, // Size of the first dimension
    (_) => List.generate(
      30, // Size of the second dimension
      (_) => List.generate(
        30, // Size of the third dimension
        (_) => 0, // Default value for each element
      ),
    ),
  );

  List<List<List<int>>> G = List.generate(
    30,
    (_) => List.generate(
      30,
      (_) => List.generate(
        30,
        (_) => 0,
      ),
    ),
  );

  /// Computes and memoizes the dynamic programming values for F and G.
  ///
  /// [n]: The total number of elements.
  /// [f]: The first player's position.
  /// [s]: The second player's position.
  ///
  /// Returns a [List<int>] containing two integers:
  /// - The earliest round (F value).
  /// - The latest round (G value).
  List<int> dp(int n, int f, int s) {
    // Check if the result for this state (n, f, s) has already been computed
    // and stored in the memoization tables F and G.
    // If F[n][f][s] is not 0, it means it has been computed.
    if (F[n][f][s] != 0) {
      return [F[n][f][s], G[n][f][s]];
    }

    // Base case: If the sum of player positions equals n + 1,
    // it means they are in the same "pair" or directly opposite each other,
    // so it takes 1 round and the result is 1 for both earliest and latest.
    if (f + s == n + 1) {
      return [1, 1];
    }

    // Optimization: If f + s is greater than n + 1, it implies a symmetric
    // case. The problem has a property where F(n,f,s) = F(n, n + 1 - s, n + 1 - f).
    // We can compute the result using the symmetric positions to avoid redundant calculations.
    if (f + s > n + 1) {
      List<int> res = dp(n, n + 1 - s, n + 1 - f);
      F[n][f][s] = res[0]; // Store the computed earliest round
      G[n][f][s] = res[1]; // Store the computed latest round
      return [F[n][f][s], G[n][f][s]];
    }

    // Initialize 'earliest' to positive infinity and 'latest' to negative infinity.
    // This ensures that the first comparison with any valid result will correctly
    // set these values to the minimum and maximum found so far.
    double earliest = double.infinity;
    double latest = double.negativeInfinity;

    // Calculate n_half using integer division.
    int nHalf = (n + 1) ~/ 2;

    // Branch based on the position of 's' relative to the middle of the range.
    if (s <= nHalf) {
      // Case 1: 's' is on the left side or in the exact middle.
      // Iterate through possible 'i' and 'j' values to explore subproblems.
      for (int i = 0; i < f; ++i) {
        for (int j = 0; j < s - f; ++j) {
          // Recursively call dp for the subproblem.
          List<int> res = dp(nHalf, i + 1, i + j + 2);
          // Update 'earliest' with the minimum earliest round found.
          earliest = min(earliest, res[0].toDouble());
          // Update 'latest' with the maximum latest round found.
          latest = max(latest, res[1].toDouble());
        }
      }
    } else {
      // Case 2: 's' is on the right side.
      // Calculate s_prime and mid for the transformed subproblem.
      int sPrime = n + 1 - s;
      int mid = (n - 2 * sPrime + 1) ~/ 2;
      // Iterate through possible 'i' and 'j' values.
      for (int i = 0; i < f; ++i) {
        for (int j = 0; j < sPrime - f; ++j) {
          // Recursively call dp for the subproblem.
          List<int> res = dp(nHalf, i + 1, i + j + mid + 2);
          // Update 'earliest' and 'latest'.
          earliest = min(earliest, res[0].toDouble());
          latest = max(latest, res[1].toDouble());
        }
      }
    }

    // After exploring all subproblems, calculate the final F and G values
    // for the current state (n, f, s).
    // Add 1 to the earliest/latest round from subproblems to account for the current round.
    // Cast 'earliest' and 'latest' back to int before storing.
    F[n][f][s] = earliest.toInt() + 1;
    G[n][f][s] = latest.toInt() + 1;

    // Return the computed earliest and latest rounds for this state.
    return [F[n][f][s], G[n][f][s]];
  }

  /// Calculates the earliest and latest rounds for two players in a tournament.
  ///
  /// [n]: The total number of players.
  /// [firstPlayer]: The initial position of the first player.
  /// [secondPlayer]: The initial position of the second player.
  ///
  /// Returns a [List<int>] containing two integers:
  /// - The earliest possible round they can meet.
  /// - The latest possible round they can meet.
  List<int> earliestAndLatest(int n, int firstPlayer, int secondPlayer) {
    // The problem has a symmetry where F(n,f,s) = F(n,s,f).
    // To simplify calculations and ensure consistent memoization,
    // always ensure that `firstPlayer` is less than or equal to `secondPlayer`.
    if (firstPlayer > secondPlayer) {
      int temp = firstPlayer;
      firstPlayer = secondPlayer;
      secondPlayer = temp;
    }

    // Call the dynamic programming function with the (potentially swapped) player positions.
    List<int> res = dp(n, firstPlayer, secondPlayer);

    // Return the earliest and latest rounds.
    return [res[0], res[1]];
  }
}