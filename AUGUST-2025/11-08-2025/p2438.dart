class Solution {
    List<int> productQueries(int n, List<List<int>> queries) {
        int mod = pow(10, 9).toInt() + 7;
        List<int> powers = [];
        List<int> valid = [];
        for (int i = 0; i < 32; i++) {
            powers.add(pow(2, i).toInt());
        }

        var index = powers.lastIndexWhere((e) => e <= n);

        while (n > 0) {
            valid.add(powers[index]);
            n -= powers[index];
            index = powers.lastIndexWhere((e) => e <= n);
        }

        List<int> p = valid.reversed.toList();
        List<int> res = [];
        List<BigInt> prefix = List.filled(p.length, BigInt.zero);
        prefix[0] = BigInt.from(p[0]);

        for (int i = 1; i < p.length; i++) {
            prefix[i] = BigInt.from(p[i]) * prefix[i - 1];
        }

        for (final query in queries) {
            final start = query[0];
            final end = query[1];
            if (start == 0) {
                res.add((prefix[end] % BigInt.from(mod)).toInt());
            } else {
                res.add(((prefix[end] ~/ prefix[start - 1]) % BigInt.from(mod)).toInt());
            }
        }

        return res;
    }
}