object Solution {
    def matchPlayersAndTrainers(players: Array[Int], trainers: Array[Int]): Int =
        players.sortInPlace()
        trainers.sortInPlace()

        @scala.annotation.tailrec
        def matchAtIdx(playersIdx: Int, trainersIdx: Int, acc: Int): Int =
            if playersIdx >= players.length || trainersIdx >= trainers.length then
                acc
            else if players(playersIdx) <= trainers(trainersIdx) then
                matchAtIdx(playersIdx + 1, trainersIdx + 1, acc + 1)
            else // if players(playersIdx) > trainersIdx then
                matchAtIdx(playersIdx, trainersIdx + 1, acc)
        
        matchAtIdx(playersIdx = 0, trainersIdx = 0, acc = 0)
    end matchPlayersAndTrainers
}