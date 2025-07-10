int maxFreeTime(int eventTime, int k, int* startTime, int startTimeSize, int* endTime, int endTimeSize) {
    int gaps[startTimeSize+1];

    gaps[0] = startTime[0] - 0;
    for(int i=1; i<startTimeSize; i++){
        gaps[i] = startTime[i] - endTime[i-1];
    }
    gaps[startTimeSize] = eventTime - endTime[endTimeSize-1];

    int window_value=0;
    //first window
    for(int i=0; i<=k; i++){
        window_value += gaps[i];
    }
    int max = window_value;

    for(int i=(k+1); i<startTimeSize+1; i++){
        window_value -= gaps[i-(k+1)];
        window_value += gaps[i];
        if(window_value > max){
            max = window_value;
        }
    }

    return max;
}