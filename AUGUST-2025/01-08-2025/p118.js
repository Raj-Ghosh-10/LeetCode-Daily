/**
 * @param {number} numRows
 * @return {number[][]}
 */
var generate = function(numRows) {
    let rst = [[1]]
    for(let i = 1; i < numRows; i++){
        rst.push([1, ...helper(rst[i-1]), 1])
    }
    return rst
};
function helper(upperRow){
    let rst = [];

    for(let i = 1; i < upperRow.length; i++){
        rst.push(upperRow[i] + upperRow[i - 1]);
    }

    return rst
}