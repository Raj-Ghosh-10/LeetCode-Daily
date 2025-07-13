class Solution {
  int matchPlayersAndTrainers(List<int> players, List<int> trainers) {
  players.sort();
  trainers.sort();
  int count = 0, i = 0, j = 0;
  while (i < players.length && j < trainers.length) {
    if (players[i] <= trainers[j]) {
      count++;
      i++;
    }
    j++;
  }
  return count;
}
}