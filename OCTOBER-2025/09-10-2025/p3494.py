class Solution:
    def minTime(self, skill: List[int], mana: List[int]) -> int:
        # Calculate time for brewing 0th potion by each wizard
        potionBrewTimes = []
        sum = 0
        for s in skill:
            sum += mana[0] * s
            potionBrewTimes.append(sum)

        # Calculate time for brewing rest of the potions
        for i in range(1, len(mana)):
            startTime = potionBrewTimes[0]

            # Calculate prefix sum of brewing times for ith potion
            potionTimesSum = []
            sum = 0
            for s in skill:
                sum += mana[i] * s
                potionTimesSum.append(sum)

            # Find the start time for brewing ith potion
            for j in range(1, len(skill)):
                if startTime + potionTimesSum[j - 1] < potionBrewTimes[j]:
                    startTime = potionBrewTimes[j] - potionTimesSum[j - 1]

            # Update the brewing time for ith potion
            for j in range(len(skill)):
                potionBrewTimes[j] = potionTimesSum[j] + startTime

        return potionBrewTimes[len(skill) - 1]