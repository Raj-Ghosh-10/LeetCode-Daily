class Solution:
    def maxPartitionsAfterOperations(self, s: str, k: int) -> int:
        S = len(s)
        
        @cache
        def dfs(i, mask, can_change):
            if i == S:
                return 1

            ans = 0
            j = ord(s[i]) - ord('a')
            
            # don't change letter
            new_mask = mask | (1 << j)
            # taking letter = must start partition
            if new_mask.bit_count() > k:
                ans = max(ans, 1 + dfs(i + 1, 1 << j, can_change))
            else:
                ans = max(ans, dfs(i + 1, new_mask, can_change))

            # change letter
            if can_change:
                for ch in range(26):
                    # don't change char to itself
                    if ch == j:
                        continue
                    new_mask = mask | (1 << ch)
                    if new_mask.bit_count() > k:
                        ans = max(ans, 1 + dfs(i + 1, 1 << ch, False))
                    else:
                        ans = max(ans, dfs(i + 1, new_mask, False))
            
            return ans
                

        return dfs(0, 0, True)