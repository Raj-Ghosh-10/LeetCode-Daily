class Solution:
    def avoidFlood(self, rains: List[int]) -> List[int]:
        n = len(rains)
        res = [-1] * n

        #full_lakes, dry_dates = {}, []
        lookup = dict()         # stores {rain_lake: llatest rain on this lake
        dry_days = []           # stores dry days
        

        for day, rain_lake in enumerate(rains):
            # case1; no rain; we can dry one lake
            # decide on dry days later
            if rain_lake == 0:  
                dry_days += [day]  
                continue

            # case2; lake is already full
            if rain_lake in lookup:  
                # run binary search to find out earliest day we dry the lake
                last_day = lookup[rain_lake]
                ind = bisect_left(dry_days, last_day)

                # stop; not possible
                if ind >= len(dry_days): 
                    return []  

                # pop the ind index 
                cand = dry_days.pop(ind)

                # dry the lake at the cand date
                res[cand] = rain_lake  

            # update latest rain on this lake
            lookup[rain_lake] = day

        # dry the remaining dry_daysby allocating 1 as on these days, rain > 0 and can't use -1
        for day in dry_days:
            res[day] = 1

        return res