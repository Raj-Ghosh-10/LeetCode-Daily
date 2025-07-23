class Solution {
public:
    int ab(string &s,int x)
    {
        int sum=0;
        stack<char>stk;
        for(int i=0;i<s.size();i++)
        {
            if(s[i]=='b' && !stk.empty() && stk.top()=='a')
            {
                sum+=x;
                stk.pop();
            }
            else
            {
                stk.push(s[i]);
            }
        }
        s="";
        while(!stk.empty())
        {
            s+=stk.top();
            stk.pop();
        }
        reverse(s.begin(),s.end());
        return sum;
    }
     int ba(string &s,int x)
    {
        int sum=0;
        stack<char>stk;
        for(int i=0;i<s.size();i++)
        {
            if(s[i]=='a' && !stk.empty() && stk.top()=='b')
            {
                sum+=x;
                stk.pop();
            }
            else
            {
                stk.push(s[i]);
            }
        }
        s="";
        while(!stk.empty())
        {
            s+=stk.top();
            stk.pop();
        }
        reverse(s.begin(),s.end());
        return sum;
    }
    int maximumGain(string s, int x, int y) {
        int total=0;
        if(x>=y)
        {
            total+=ab(s,x);
            total+=ba(s,y);
        }
        else
        {
            total+=ba(s,y);
            total+=ab(s,x);
        }
        return total;
    }
};