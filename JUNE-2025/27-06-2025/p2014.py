class Solution:
    def longestSubsequenceRepeatedK(self, s: str, k: int) -> str:
        # only include characters that appear at least k times
        counts = {char: count for char, count in Counter(s).items() if count >= k}
        if not counts:
            return ''

        s = ''.join(char for char in s if char in counts)   # shorten the string to only relevant chars
        
        # returns True if passed string is a subsequence of s
        def is_subseq(sseq):
            i = 0
            n = len(sseq)
            for char in s:
                if char == sseq[i]:
                    i += 1
                    if i == n:
                        return True
            return False

        valid = deque(counts.keys())
        largest = max(counts.keys())

        while valid:
            sseq = valid.popleft()
            
            for char in sseq:   # subtract current substring from counts
                counts[char] -= k

            for char, count in counts.items():
                if count < k:   # filter out characters that don't occur enough
                    continue

                new = sseq + char
                if is_subseq(new * k):
                    valid.append(new)
                    if len(new) > len(largest) or (len(new) == len(largest) and new > largest):
                        largest = new
            
            for char in sseq:   # restore the dict
                counts[char] += k

        return largest