class Solution:
    def matchPlayersAndTrainers(self, players: List[int], trainers: List[int]) -> int:
        players.sort()
        trainers.sort()
        
        count = 0
        i = j = 0
        n_players = len(players)
        n_trainers = len(trainers)
        
        while i < n_players and j < n_trainers:
            if players[i] <= trainers[j]:
                count += 1
                i += 1
                j += 1
            else:
                j += 1
                
        return count