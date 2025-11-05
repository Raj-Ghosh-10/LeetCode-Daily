#python

class Solution(object):
    def findXSum(self, nums, k, x):
        res = []

        counts = defaultdict(int)
        for i in range(k):
            counts[nums[i]] += 1
        low = []

        for n, c in counts.items():
            heapq.heappush(low, (-c, -n))

        value = 0
        high = []
        high_nums = set()

        while len(high_nums) < x and low:
            c, n = heapq.heappop(low)
            heapq.heappush(high, (-c, -n))
            high_nums.add(-n)
            value += c * n

        res.append(value)
        
        for i in range(k, len(nums)):
            leaving = nums[i - k]
            entering = nums[i]

            counts[leaving] -= 1
            counts[entering] += 1

            if leaving in high_nums:
                heapq.heappush(high, (counts[leaving], leaving))
                value -= leaving
            else:
                heapq.heappush(low, (-counts[leaving], -leaving))

            if entering in high_nums:
                heapq.heappush(high, (counts[entering], entering))
                value += entering
            else:
                heapq.heappush(low, (-counts[entering], -entering))

            while high and (counts[high[0][1]] != high[0][0] or high[0][1] not in high_nums):
                heapq.heappop(high)

            while low and (counts[-low[0][1]] != -low[0][0] or -low[0][1] in high_nums):
                heapq.heappop(low)

            if low and high:
                if -low[0][0] > high[0][0] or -low[0][0] >= high[0][0] and -low[0][1] > high[0][1]:
                    new_count, new_high = heapq.heappop(low)
                    old_count, old_high = heapq.heappop(high)
                    high_nums.remove(old_high)
                    high_nums.add(-new_high)

                    value -= (old_high * counts[old_high])
                    value += (-new_high * counts[-new_high])
                    heapq.heappush(high, (-new_count, -new_high))
                    heapq.heappush(low, (-old_count, -old_high))

            while low and len(high_nums) < x:
                new_count, new_high = heapq.heappop(low)
                value += (-new_high * counts[-new_high])
                heapq.heappush(high, (-new_count, -new_high))
                high_nums.add(-new_high)

            res.append(value)

        return res


#python 3


class Solution:
    def findXSum(self, nums, k, x):
        res = []
        cnt = defaultdict(int)

        top = []
        bot = []
        running_sum = 0

        def key_for(count, val):
            return (-count, -val)

        def remove_from_sorted(lst, key):
            i = bisect_left(lst, key)
            if i < len(lst) and lst[i] == key:
                lst.pop(i)
                return True
            return False

        for i, v in enumerate(nums):
            old_count = cnt[v]

            if old_count:
                key_old = key_for(old_count, v)
                if remove_from_sorted(bot, key_old):
                    pass
                else:
                    removed = remove_from_sorted(top, key_old)
                    if removed:
                        running_sum -= old_count * v

            cnt[v] = old_count + 1
            key_new = key_for(old_count + 1, v)
            insort(top, key_new)
            running_sum += (old_count + 1) * v

            if len(top) > x:
                moved_key = top.pop()
                moved_count = -moved_key[0]
                moved_val = -moved_key[1]
                running_sum -= moved_count * moved_val
                insort(bot, moved_key)
            if i >= k:
                out = nums[i - k]
                c = cnt[out]
                key_curr = key_for(c, out)
                if remove_from_sorted(bot, key_curr):
                    pass
                else:
                    removed = remove_from_sorted(top, key_curr)
                    if removed:
                        running_sum -= c * out

                if c > 1:
                    new_key = key_for(c - 1, out)
                    insort(bot, new_key)
                cnt[out] = c - 1

                if len(top) < x and bot:
                    promote_key = bot.pop(0)
                    promote_count = -promote_key[0]
                    promote_val = -promote_key[1]
                    insort(top, promote_key)
                    running_sum += promote_count * promote_val

            if i + 1 >= k:
                res.append(running_sum)

        return res