typedef pair<double,int> pi ; 
class Solution {
public:
    double maxAverageRatio(vector<vector<int>>& classes, int extraStudents) {
        // school -> class , then final exam 
        // class i = pass i , total i ; 
        int n = classes.size() ; 
        priority_queue<pi> pq ; 
        for(int i=0 ; i<n; i++){
            auto c = classes[i] ; 
            double percentage = (1.0)*(c[0])/(c[1]) ; 
            double newpercentage = (1.0)*(c[0]+1)/(c[1]+1) ;
            double perincrease = newpercentage - percentage ; 
            pq.push({perincrease , i}) ;
        }
        while(extraStudents--){
            auto [p , idx] = pq.top() ; 
            pq.pop() ; 
            classes[idx][0] += 1; 
            classes[idx][1] += 1; 
            auto c = classes[idx] ; 
            double percentage = (1.0)*(c[0])/(c[1]) ; 
            double newpercentage = (1.0)*(c[0]+1)/(c[1]+1) ;
            double perincrease = newpercentage - percentage ; 
            pq.push({perincrease , idx}) ;
        }
        double ans = 0.0 ; 
        for(int i=0 ; i<n; i++){
            auto c = classes[i] ; 
            double percentage = (1.0)*(c[0])/(c[1]) ; 
            ans += percentage ; 
        }
        return (1.0)*(ans)/n ; 
    }
};