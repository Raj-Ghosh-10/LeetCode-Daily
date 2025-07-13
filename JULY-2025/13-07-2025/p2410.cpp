class Solution {
public:
    int matchPlayersAndTrainers(vector<int>& players, vector<int>& trainers) {
        int x=players.size(),y=trainers.size(),count=0;
        int i=0,j=0;
        sort(trainers.begin(),trainers.end());
        sort(players.begin(),players.end());

        while(i<x && j<y){
           if(players[i]<=trainers[j]){
            trainers[i]=-1;
            count++;
            i++;
           }
           j++;
        }
        return count;
    }
};