class Solution {
    func earliestAndLatest(_ n: Int, _ firstPlayer: Int, _ secondPlayer: Int) -> [Int] {
        [firstPlayer, secondPlayer]
            .map { min($0, n + 1 - $0) }
            .minAndMax()
            .flatMap { [half = (n + 1) / 2] (r1: Int, r2: Int) -> [Int]? in
                product(0 ..< r1, 0 ..< r2 - r1)
                    .map { [isSameSide = (firstPlayer < half) == (secondPlayer < half)] (c1: Int, c2: Int) -> (Int, Int) in
                        (c1 + 1, c1 + c2 + 2 + (isSameSide ? 0 : half - r2)) 
                    }
                    .flatMap { (p1: Int, p2: Int) -> [Int] in
                        earliestAndLatest(half, p1, p2)
                    }
                    .minAndMax()
                    .map { [$0.min + 1, $0.max + 1] } 
            } ?? [1, 1]
    }
}