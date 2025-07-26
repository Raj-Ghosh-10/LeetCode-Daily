class Solution:
    def maxSubarrays(self, n: int, conflictingPairs: List[List[int]]) -> int:
        valid = 0

        conflictingpoints = [[] for _ in range(n+1)]
        for i in conflictingPairs:
            conflictingpoints[max(i)].append(min(i))

        conflict = 0
        second_conflict = 0

        extra = [0]*(n+1)

        for end in range(1, n+1):  #will count total subarrays ending at this point 
            #check all conflicting points end
            for u in conflictingpoints[end]:
                if u>=conflict:
                    second_conflict = conflict
                    conflict = u
                elif u > second_conflict:
                    second_conflict = u
            valid+=(end - conflict)
            extra[conflict]+=(conflict-second_conflict)

        return valid + max(extra)