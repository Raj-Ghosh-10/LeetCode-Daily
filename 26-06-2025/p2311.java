class Solution {
    public int longestSubsequence(String s, int k) {
        String s1= Integer.toBinaryString(k);
        if(s1.length()>s.length()) return s.length();
        int num=0;
        for(int i=0; i<s.length()-s1.length(); i++){
            if(s.charAt(i)=='0') num++;
        }  
        int x=s1.compareTo(s.substring(s.length()-s1.length(),s.length()));
        if(x>=0) return num+s1.length();
        else return num+s1.length()-1;  
    }
}