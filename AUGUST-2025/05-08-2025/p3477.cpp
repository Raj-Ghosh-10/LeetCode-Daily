class Solution {
public:
    int numOfUnplacedFruits(vector<int>& fruits, vector<int>& baskets) {

        int unplaced = fruits.size();

        for(int i = 0;i<fruits.size();i++)
        {
            int num = fruits[i];
            for(int j = 0;j<baskets.size();j++)
            {
                if(baskets[j]>=num)
                {
                    baskets[j]=0;
                    unplaced--;
                    break;
                }
            }
        }

        return unplaced;
        
    }
};