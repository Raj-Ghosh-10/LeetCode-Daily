class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 1 else { return [[1]] }

        var arr = [[1],[1,1]]

        for i in stride(from: 2, to: numRows, by: 1){
            arr.append([arr[i-1].first!] + Array(repeating: 0, count: arr[i-1].count - 1) + [arr[i-1].last!] ) 

            for j in 1..<arr[i].count - 1 {
                arr[i][j] = arr[i-1][j-1] + arr[i-1][j]
            }
        }

        return arr
    }
}