#python

class Solution(object):
    def maxPower(self, stations, r, k):
        """
        :type stations: List[int]
        :type r: int
        :type k: int
        :rtype: int
        """
        prefix = [0]
        size = len(stations)
        for i in stations:
            prefix.append(prefix[-1] + i)
        for i in range(size):
            stations[i] = prefix[min(i+r+1, size)] - prefix[max(0, i-r)]

        def check(min_power):
            diff = [0] * size
            cur_diff = 0
            cnt_station = 0
            for i, power in enumerate(stations):
                cur_diff += diff[i]
                power_diff = min_power - power - cur_diff

                if power_diff > 0: 
                    cnt_station += power_diff
                    if cnt_station > k:
                        return False
                    cur_diff += power_diff
                    if i + 2 * r + 1 < size: diff[i + 2 * r + 1] -= power_diff

            return True
        left = min(stations)
        right = left + k
        while left <= right:
            mid = left + (right - left) // 2
            if check(mid): left = mid + 1
            else: right = mid - 1

        return right

#python3

class Solution:
    def maxPower(self, stations: List[int], r: int, k: int) -> int:
        n = len(stations)
        df = [0] * (n + 5)
        for i, j in enumerate(stations):
            df[max(0, i - r)] += j
            df[min(n - 1, i + r) + 1] -= j
        lo, hi = min(accumulate(df[:n])), 2 * 10 ** 10
        def check(mid):
            diff = df[:]
            cur, cnt = 0, 0
            for i in range(n):
                cur += diff[i]
                if cur < mid:
                    cnt += mid - cur
                    diff[min(n - 1, i + 2 * r) + 1] -= mid - cur
                    cur = mid
                if cnt > k: return False
            return True
    
        while lo < hi:
            mid = lo + hi + 1 >> 1
            if check(mid): lo = mid
            else: hi = mid - 1
        return lo