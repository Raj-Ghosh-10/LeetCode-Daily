import heapq

class FoodRatings:

    def __init__(self, foods: List[str], cuisines: List[str], ratings: List[int]):
        self.food_info = {}  # food -> (cuisine, rating)
        self.cuisine_map = {} # cuisine -> heap of (-rating, food)
        
        n = len(foods)
        for i in range(n):
            food = foods[i]
            cuisine = cuisines[i]
            rating = ratings[i]
            self.food_info[food] = (cuisine, rating)
            if cuisine not in self.cuisine_map:
                self.cuisine_map[cuisine] = []
            heapq.heappush(self.cuisine_map[cuisine], (-rating, food))
        

    def changeRating(self, food: str, newRating: int) -> None:
        cuisine, oldRating = self.food_info[food]
        self.food_info[food] = (cuisine, newRating)
        heapq.heappush(self.cuisine_map[cuisine], (-newRating, food))
        

    def highestRated(self, cuisine: str) -> str:
        heap = self.cuisine_map[cuisine]
        while heap:
            neg_rating, food = heap[0]
            current_rating = self.food_info[food][1]
            if -neg_rating != current_rating:
                heapq.heappop(heap)
            else:
                return food
        return ""  # should not happen if cuisine exists