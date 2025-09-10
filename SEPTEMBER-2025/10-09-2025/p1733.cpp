class Solution {
public:
    int minimumTeachings(int n, vector<vector<int>>& languages,
                         vector<vector<int>>& friendships) {
        // creating a language catalogue for each user
        unordered_map<int, unordered_set<int>> mp;
        for (int i = 0; i < languages.size(); i++) {
            mp[i + 1].insert(languages[i].begin(),
                             languages[i].end());
        }
        //finding those who are having issue
        unordered_set<int> needToTeach;
        for (int i = 0; i < friendships.size(); i++) {
            bool check = true;
            for (int j : mp[friendships[i][0]]) {
                if (mp[friendships[i][1]].count(j) > 0) {
                    check = false;
                    break;
                }
            }
            if (check) {
                needToTeach.insert(friendships[i][0]);
                needToTeach.insert(friendships[i][1]);
            }
        }
        // finding the most popular language among gareebs
        int marker, maxi;
        for (int i = 1; i <= n; i++) {
            int count = 0;
            for (auto j : needToTeach) {
                if (mp[j].count(i) > 0) {
                    count++;
                }
            }
            if (maxi < count) {
                maxi = max(maxi, count);
                marker = i;
            }
        }
        return needToTeach.size()-maxi;
    }
};