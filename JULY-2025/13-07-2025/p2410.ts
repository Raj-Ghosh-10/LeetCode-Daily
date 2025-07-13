function matchPlayersAndTrainers(players: number[], trainers: number[]): number {
    players.sort((a,b) => a - b);
    trainers.sort((a,b) => a - b);
    let count = 0;
    let pIdx = 0;

    for(const trainer of trainers){
        if(players[pIdx] <= trainer){
            pIdx++
            count++;
        }
    }

    return count;
};