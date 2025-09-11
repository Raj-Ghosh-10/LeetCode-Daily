class Solution {
    public String sortVowels(String s) {
 String h=s.toLowerCase();
    List<Integer> l1 = new ArrayList<>();
    for (int i=0;i<s.length();i++){
        if(h.charAt(i)=='i'||h.charAt(i)=='o'||h.charAt(i)=='u'||h.charAt(i)=='e'||h.charAt(i)=='a'){
            l1.add((int)s.charAt(i));
        }}
        Collections.sort(l1);
        String ans="";
        for (int i=0;i<s.length();i++){
        if(h.charAt(i)=='i'||h.charAt(i)=='o'||h.charAt(i)=='u'||h.charAt(i)=='e'||h.charAt(i)=='a'){
            int x=l1.remove(0);
            char c=(char)x;
            ans+=c;

        }
        else{
            ans+=s.charAt(i);
        }
        
        }
return ans;
    
    



    }
}