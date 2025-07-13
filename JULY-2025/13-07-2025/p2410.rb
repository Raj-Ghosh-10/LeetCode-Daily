# @param {Integer[]} players
# @param {Integer[]} trainers
# @return {Integer}
def match_players_and_trainers(players, trainers)

    players.sort!
    trainers.sort!
    i = 0
    j = 0
    answer = 0
    while i < players.size and j < trainers.size
        if players[i] <= trainers[j]
            answer += 1
            i += 1
            j += 1
        elsif players[i] > trainers[j]
            j += 1     
        else
            break       
        end
    end
    
    answer
end
