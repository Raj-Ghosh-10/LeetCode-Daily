class Solution:
    def mostBooked(self, n: int, meetings: List[List[int]]) -> int:
        meetings.sort()

        available_rooms = list(range(n))
        heapq.heapify(available_rooms)

        busy_rooms = []

        room_meeting_count = [0] * n

        for start, end in meetings:
            while busy_rooms and busy_rooms[0][0] <= start:
                free_time, room = heapq.heappop(busy_rooms)
                heapq.heappush(available_rooms, room)

            if available_rooms:
                room = heapq.heappop(available_rooms)
                heapq.heappush(busy_rooms, (end, room))
            else:
                earliest_end_time, room = heapq.heappop(busy_rooms)
                duration = end - start
                new_end = earliest_end_time + duration
                heapq.heappush(busy_rooms, (new_end, room))
        
            room_meeting_count[room] += 1

        max_count = max(room_meeting_count)
        for i in range(n):
            if room_meeting_count[i] == max_count:
                return i 

        