struct comp {
    bool operator()(const pair<int,string> &a, const pair<int,string> &b) const {
        if (a.first == b.first) {
            return a.second < b.second;
        }
        return a.first > b.first;
    }
};
class FoodRatings {
public:
    unordered_map<string,set<pair<int,string>,comp>> mpp;
    unordered_map<string,pair<string,int>> foodMapping;
    FoodRatings(vector<string>& foods, vector<string>& cuisines, vector<int>& ratings) {
        int n = foods.size();
        for(int i = 0;i<n;i++){
            mpp[cuisines[i]].insert({ratings[i],foods[i]});
            foodMapping[foods[i]] = {cuisines[i],ratings[i]};
        }
    }
    
    void changeRating(string food, int newRating) {
        auto key = foodMapping[food];
        mpp[key.first].erase({key.second,food});
        mpp[key.first].insert({newRating,food});
        foodMapping.erase(food);
        foodMapping[food] = {key.first,newRating};
    }
    
    string highestRated(string cuisine) {
        auto &it = mpp[cuisine];

        string ans;
        for(auto st:it){
            ans = st.second;
            break;
        }
        return ans;
    }
};

/**
 * Your FoodRatings object will be instantiated and called as such:
 * FoodRatings* obj = new FoodRatings(foods, cuisines, ratings);
 * obj->changeRating(food,newRating);
 * string param_2 = obj->highestRated(cuisine);
 */