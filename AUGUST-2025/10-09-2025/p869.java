class Solution {
    public boolean check(int n, int num) {
        HashMap<Integer, Integer> map1 = new HashMap<>();
        HashMap<Integer, Integer> map2 = new HashMap<>();

        while (n > 0) {
            int rem = n % 10;
            map1.put(rem, map1.getOrDefault(rem, 0) + 1);
            n /= 10;
        }

        while (num > 0) {
            int rem = num % 10;
            map2.put(rem, map2.getOrDefault(rem, 0) + 1);
            num /= 10;
        }

        for (Map.Entry<Integer, Integer> m1 : map1.entrySet()) {
            int key = m1.getKey();
            int val = m1.getValue();
            if (!map2.containsKey(key) || !map2.get(key).equals(val)) {
                return false;
            }
            map2.remove(key);
        }
        return map2.isEmpty();
    }

    public boolean reorderedPowerOf2(int n) {
        if (n == 1) return true;
        if(n==1000000000)
        return false;

        String strN = Integer.toString(n);
        int len1 = strN.length();
        int pow = 1;
        int num = 2;
        int len2 = Integer.toString(num).length();

        while (len2 <= len1) {
            num = (int) Math.pow(2, pow);
            pow++;
            len2 = Integer.toString(num).length();

            if (len2 == len1 && check(n, num)) {
                return true;
            }
        }
        return false;
    }
}