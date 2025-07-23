class Solution {
  int maximumGain(String s, int x, int y) {
   
    return (x > y) ? pointsGain(s, x, y, 'ab', 'ba') : pointsGain(s, y, x, 'ba', 'ab');
  }

    int pointsGain(String s, int p1, int p2, String first, String second) {
        List<String> stack = [];
        int score = 0;

        for(int i = 0; i < s.length; i++) {
            if(stack.isNotEmpty && stack.last + s[i] == first) {
                stack.removeLast();
                score += p1;
            }
            else
                stack.add(s[i]);
        }

        s = stack.join();
        stack = [];

        for(int i = 0; i < s.length; i++) {
            if(stack.isNotEmpty && stack.last + s[i] == second) {
                stack.removeLast();
                score += p2;
            }
            else
                stack.add(s[i]);
    }
    return score;
}
}