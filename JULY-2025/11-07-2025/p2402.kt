class Solution {
    fun mostBooked(n: Int, meetings: Array<IntArray>): Int {
        val sortedMeetings = meetings.sortedBy { it[0] }
        val rooms = Array(n) { Room(it) }
        for (meeting in sortedMeetings) {
            var minRoomAvailable: Room = rooms[0]
            var minAvailabilityTime: Long = Long.MAX_VALUE
            for (room in rooms) {
                if (room.timeToFree <= meeting[0]) {
                    minRoomAvailable = room
                    break
                }
                if (minAvailabilityTime > room.timeToFree) {
                    minAvailabilityTime = room.timeToFree
                    minRoomAvailable = room
                }
            }
            minRoomAvailable.apply {
                timeToFree =
                    if (timeToFree < meeting[0]) meeting[1].toLong()
                    else timeToFree + (meeting[1] - meeting[0])
                noOfMeetings++
            }
            rooms[minRoomAvailable.id] = minRoomAvailable
        }
        return rooms.maxBy { it.noOfMeetings }.id
    }
}

data class Room(
    val id: Int,
    var timeToFree: Long = 0L,
    var noOfMeetings: Int = 0
)