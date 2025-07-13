/**
 * @param {number[]} players
 * @param {number[]} trainers
 * @return {number}
 */
var matchPlayersAndTrainers = function(players, trainers) {
players.sort((a, b) => b - a);
trainers.sort((a, b) => b - a);
let i = 0; // pointer for players
let j = 0; // pointer for trainers
let count = 0;
while (i < players.length && j < trainers.length) {
    if (players[i] <= trainers[j]) {
        count++;    // Match found
        i++;        // Move to next player
        j++;        // Move to next trainer
    } else {
        i++;        // No match → eliminate player
    }
}
return count;
};