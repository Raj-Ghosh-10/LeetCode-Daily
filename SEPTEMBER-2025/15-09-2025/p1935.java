class Solution {
    public int canBeTypedWords(String text, String brokenLetters) {
        HashSet<Character> broken = new HashSet<>();
        for (char ch : brokenLetters.toCharArray()) {
            broken.add(ch);
        }

        int count = 0;
        int i = 0;

        while (i < text.length()) {
            boolean flag = true;
            while (i < text.length() && text.charAt(i) != ' ') {
                char ch = text.charAt(i);
                if (broken.contains(ch)) {
                    flag = false;
                }
                i++;
            }

            if (flag) count++;
            i++;
        }

        return count;
    }
}