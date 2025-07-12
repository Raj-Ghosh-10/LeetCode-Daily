/**
 * @param {number} n
 * @param {number} firstPlayer
 * @param {number} secondPlayer
 * @return {number[]}
 */
var earliestAndLatest = function(n, firstPlayer, secondPlayer) {
    // Determine the lower and upper player positions
    let lower = Math.min(firstPlayer, secondPlayer);
    let upper = Math.max(firstPlayer, secondPlayer);
    
    // If they are mirrored positions — they will meet in the first round
    if (lower + upper === n + 1) {
        return [1, 1];
    }
    
    // Handle base cases for 3 or 4 players
    if (n === 3 || n === 4) {
        return [2, 2];
    }
    
    // Mirror for symmetry in positions
    if (lower - 1 > n - upper) {
        [lower, upper] = [n + 1 - upper, n + 1 - lower];
    }
    
    // Calculate the number of players in the next round
    const nextRoundPlayers = Math.floor((n + 1) / 2);
    let minRound = n;
    let maxRound = 1;
    
    if (upper * 2 <= n + 1) {
        // Both players are in the left half of the current round
        const playersBeforeLower = lower - 1;
        const gapBetweenPlayers = upper - lower - 1;
        for (let i = 0; i <= playersBeforeLower; i++) {
            for (let j = 0; j <= gapBetweenPlayers; j++) {
                // New position for the lower player
                const newLower = i + 1;
                // New position for the upper player
                const newUpper = i + j + 2;
                const result = earliestAndLatest(nextRoundPlayers, newLower, newUpper);
                minRound = Math.min(minRound, 1 + result[0]);
                maxRound = Math.max(maxRound, 1 + result[1]);
            }
        }
    } else {
        // Players are in opposite halves of the current round
        const mirroredPosition = n + 1 - upper;
        const playersBeforeLower = lower - 1;
        const gapBetweenLowerAndMirrored = mirroredPosition - lower - 1;
        const gapBetweenUpperAndMirrored = upper - mirroredPosition - 1;
        for (let i = 0; i <= playersBeforeLower; i++) {
            for (let j = 0; j <= gapBetweenLowerAndMirrored; j++) {
                // New position for the lower player
                const position1 = i + 1;
                // New position for the upper player
                const position2 = i + j + 1 + Math.floor((gapBetweenUpperAndMirrored + 1) / 2) + 1;
                const result = earliestAndLatest(nextRoundPlayers, position1, position2);
                minRound = Math.min(minRound, 1 + result[0]);
                maxRound = Math.max(maxRound, 1 + result[1]);
            }
        }
    }
    
    return [minRound, maxRound];
};