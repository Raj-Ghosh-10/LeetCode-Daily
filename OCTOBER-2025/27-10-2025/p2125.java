class Solution {
    public int numberOfBeams(String[] bank) {
        int count = 0, prev =0, curr = 0;
        for(String st : bank){
            curr = 0;
            for(char ch : st.toCharArray()){
                if(ch == '1'){
                    curr++;
                }
            }
            count+=(curr * prev);
            if(curr>0){
                prev = curr;
            }
        }
        return count;
    }
}