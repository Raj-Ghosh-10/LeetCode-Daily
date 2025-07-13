public class Solution {
    public int MatchPlayersAndTrainers(int[] players, int[] trainers) {
        // Sort both arrays to apply greedy matching
        Array.Sort(players);
        Array.Sort(trainers);

        int i = 0; // pointer for players
        int j = 0; // pointer for trainers
        int ans = 0; // count of successful matches

        // Use two pointers to find optimal matches
        while (i < players.Length && j < trainers.Length) {
            if (players[i] <= trainers[j]) {
                // Match found: current player can be trained by current trainer
                ans++;
                i++;
                j++;
            } else {
                // Current trainer too weak, try next stronger trainer
                j++;
            }
        }

        // Return the total number of matched player-trainer pairs
        return ans;
    }
}