
class Solution:
    #g#1 d#1 a2 b2 c3
    def get_range_sum(self,start:int,end:int)->int:
        if start > end:
            return 0
        if start == end:
            return (start + 1)*(4**(start + 1) - 4**start)
        sum_zero_to_n = lambda n: (n*4**(n + 2) + (2 - n)*4**(n + 1) + 1)/3
        return sum_zero_to_n(end) - sum_zero_to_n(start - 1)

    def get_range_operations(self,start:int,end:int)->int:
        start_divs = 0 if start == 0 else math.floor(math.log(start,4)) + 1
        end_divs = 0 if end == 0 else math.floor(math.log(end,4)) + 1
        rang = (end - start) + 1
        if start_divs == end_divs:
            #all elements require same
            #number of divisions. Since each operation is two divisions, divide
            #this by 2
            return math.ceil(start_divs*rang/2)
        else:
            #number of elements which need to be divided the same number of
            #times as our start value(this includes the start value)
            same_as_start_divs = 4**(start_divs) - start
            same_as_end_divs = (end - 4**(end_divs - 1)) + 1
            intermediate_divs = self.get_range_sum(start_divs,end_divs - 2)
            total_divs = same_as_start_divs*start_divs + same_as_end_divs*end_divs + intermediate_divs
            return math.ceil(total_divs/2)
        


    def minOperations(self, queries: List[List[int]]) -> int:
        total = 0
        for query in queries:
            total += self.get_range_operations(query[0],query[1])
        return total

        