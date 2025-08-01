class Solution {
public:
    vector<string> removeSubfolders(vector<string>& folder) {
        sort(folder.begin(), folder.end()); // Step 1: Sort folders
        vector<string> result;

        for (const string& f : folder) {
            if (result.empty() || f.find(result.back() + "/") != 0) {
                result.push_back(f);
            }
        }

        return result;
    }
};