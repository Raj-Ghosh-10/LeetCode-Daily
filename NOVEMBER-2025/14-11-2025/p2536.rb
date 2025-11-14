# @param {Integer} n
# @param {Integer[][]} queries
# @return {Integer[][]}
def range_add_queries(n, queries)
    x = Array.new(n) { Array.new(n, 0) }
    
    queries.each do |q|
        for i in q[0]..q[2] do
            x[i][q[1]]+=1
            x[i][q[3]+1]-=1 if q[3]+1 < n
        end
    end

    for i in 0..n-1 do
        for j in 1..n-1 do
            x[i][j] = x[i][j] + x[i][j-1]
        end
    end

    x
end