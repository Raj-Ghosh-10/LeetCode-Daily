int compare(const void* a, const void* b){
    return *(int*)a - *(int*)b;
}

int matchPlayersAndTrainers(int* players, int playersSize, int* trainers, int trainersSize) {
    qsort(players, playersSize, sizeof(players[0]), compare);
    qsort(trainers, trainersSize, sizeof(trainers[0]), compare);

    int count = 0;
    for(int i = 0, j = 0; i < playersSize && j < trainersSize; j++){
        if(players[i] <= trainers[j]){
            i++;
            count++;
        }
    }
    return count;
}