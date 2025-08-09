class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var nCont = n;

        guard nCont > 0 else {
            return false;
        }

        guard nCont > 1 else {
            return true;
        }

        while (nCont >= 1) {
            if (nCont % 2 == 0) {
                nCont /= 2;

                if (nCont == 1) {
                    return true;
                }
            } else {
                return false;
            }
        }

        return false;
    }
}