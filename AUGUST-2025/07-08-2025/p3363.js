/**
 * @param {number[][]} fruits
 * @return {number}
 */
var maxCollectedFruits = function(fruits) {
    // sum the diagonals
    const n = fruits.length
    let diags = 0
    for (let i = 0; i < n; i++) diags += fruits[i][i]

    let prevDepth = 0
    for (let i = 0; i < n-1; i++) { // i is how far towards the bottom-right we are
        let depth; // depth is how far towards the diagonal we can go
        if (i < (n-1)/2) {
            depth = i+1
        } else {
            depth = (n-1)-i
        }

        for (let j = 0; j < depth; j++) { // j is how far towards the diagonal we are
            let maxB = 0, maxR = 0
            if (j < depth-1 || prevDepth >= depth) { // can have left/up
                if (fruits[n-1-j][i-1] > maxB) {
                    maxB = fruits[n-1-j][i-1]
                }
                if (fruits[i-1][n-1-j] > maxR) {
                    maxR = fruits[i-1][n-1-j]
                }
            }
            if (j < depth-2 || prevDepth > depth || (j < depth-1 && prevDepth >= depth) ) { // can have up left/up left
                if (fruits[n-1-j-1][i-1] > maxB) {
                    maxB = fruits[n-1-j-1][i-1]
                }
                if (fruits[i-1][n-1-j-1] > maxR) {
                    maxR = fruits[i-1][n-1-j-1]
                }
            }
            if (j > 0) { // can have down left/up right
                if (fruits[n-1-j+1][i-1] > maxB) {
                    maxB = fruits[n-1-j+1][i-1]
                }
                if (fruits[i-1][n-1-j+1] > maxR) {
                    maxR = fruits[i-1][n-1-j+1]
                }
            }

            fruits[n-1-j][i] += maxB
            fruits[i][n-1-j] += maxR
        }

        prevDepth = depth
    }

    return diags + fruits[n-2][n-1] + fruits[n-1][n-2]
}