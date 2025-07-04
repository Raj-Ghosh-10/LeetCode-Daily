class Solution {
    public char kthCharacter(long k, int[] operations) {
        long[] lengths = new long[operations.length + 1];
        lengths[0] = 1;

        for(int i=0; i<operations.length; i++){
            if(operations[i] == 0){
                lengths[i+1] = lengths[i] * 2;
            } else {
                lengths[i+1] = lengths[i] * 2;
            }

            if (lengths[i+1] > k){
                lengths[i+1] = k;
            }
        }
        char ch = 'a';
        for (int i = operations.length - 1; i >= 0; i--){
            if (k <= lengths[i]){
                continue;
            }

            k -= lengths[i];

            if (operations[i] == 1){
                ch = (char) ((ch - 'a' + 1) % 26 + 'a');
            }
        }
        return ch;
    }
}