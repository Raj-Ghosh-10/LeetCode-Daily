import java.util.*;

class Solution {
    public int minimumTeachings(int n, int[][] languages, int[][] friendships) {
        int m = languages.length;
        
        // Convert user languages into a set for fast lookup (1-indexed)
        Set<Integer>[] userLanguages = new HashSet[m + 1];
        for (int i = 1; i <= m; i++) {
            userLanguages[i] = new HashSet<>();
            for (int lang : languages[i - 1]) {
                userLanguages[i].add(lang);
            }
        }
        
        // Step 1: Find problematic friendships (where no common language)
        Set<Integer> usersToConsider = new HashSet<>();
        for (int[] friendship : friendships) {
            int u = friendship[0];
            int v = friendship[1];
            
            boolean hasCommonLanguage = false;
            for (int lang : userLanguages[u]) {
                if (userLanguages[v].contains(lang)) {
                    hasCommonLanguage = true;
                    break;
                }
            }
            
            if (!hasCommonLanguage) {
                usersToConsider.add(u);
                usersToConsider.add(v);
            }
        }
        
        // Step 2: Count how many problematic users know each language
        int[] languageCount = new int[n + 1];  // 1-based indexing of languages
        for (int user : usersToConsider) {
            for (int lang : userLanguages[user]) {
                languageCount[lang]++;
            }
        }
        
        // Step 3: Choose the language known by the most problematic users
        int maxCount = 0;
        for (int i = 1; i <= n; i++) {
            maxCount = Math.max(maxCount, languageCount[i]);
        }
        
        // The result is the number of problematic users minus the maxCount
        return usersToConsider.size() - maxCount;
    }
}