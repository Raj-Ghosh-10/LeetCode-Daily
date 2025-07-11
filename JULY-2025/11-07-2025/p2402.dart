class Solution {
    int mostBooked(int n, List<List<int>> meetings) {
    List<int> ans = List<int>.filled(n, 0);
    List<int> times = List<int>.filled(n, 0);

    meetings.sort((a, b) => a[0] - b[0]);

    for (int i = 0; i < meetings.length; i++) {
        int start = meetings[i][0];
        int end = meetings[i][1];
        bool flag = false;
        int minind = -1;
        int val = 9007199254740991;

        for (int j = 0; j < n; j++) {
        if (times[j] < val) {
            val = times[j];
            minind = j;
        }
        if (times[j] <= start) {
            flag = true;
            ans[j]++;
            times[j] = end;
            break;
        }
        }

        if (!flag) {
        ans[minind]++;
        times[minind] += (end - start);
        }
    }

    int maxi = -1;
    int id = -1;

    for (int i = 0; i < n; i++) {
        if (ans[i] > maxi) {
        maxi = ans[i];
        id = i;
        }
    }

    return id;
    }

}