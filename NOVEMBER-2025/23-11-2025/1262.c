int maxSumDivThree(int* nums, int numsSize) {
    int sum = 0;

    int m1a = INT_MAX, m1b = INT_MAX;
    int m2a = INT_MAX, m2b = INT_MAX;

    for (int i = 0; i < numsSize; i++) {
        int x = nums[i];
        sum += x;

        int r = x % 3;
        if (r == 1) {
            if (x < m1a) { m1b = m1a; m1a = x; }
            else if (x < m1b) m1b = x;
        } 
        else if (r == 2) {
            if (x < m2a) { m2b = m2a; m2a = x; }
            else if (x < m2b) m2b = x;
        }
    }

    int rem = sum % 3;
    if (rem == 0) return sum;

    int remove = INT_MAX;

    if (rem == 1) {
        int opt1 = m1a;
        int opt2 = (m2b < INT_MAX) ? m2a + m2b : INT_MAX;
        remove = (opt1 < opt2 ? opt1 : opt2);
    } else {
        int opt1 = m2a;
        int opt2 = (m1b < INT_MAX) ? m1a + m1b : INT_MAX;
        remove = (opt1 < opt2 ? opt1 : opt2);
    }

    if (remove == INT_MAX) return 0;
    return sum - remove;
}