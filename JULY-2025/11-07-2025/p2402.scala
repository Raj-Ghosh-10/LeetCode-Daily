object Solution:
  // helper class
  case class MeetingRoom(roomNumber: Int, var lastMeetingEndTime: Int = 0, var meetingsHeld: Int = 0)

  import collection.mutable
  import util.Sorting

  def mostBooked(n: Int, meetings: Array[Array[Int]]): Int =
    Sorting.quickSort(meetings)(Ordering.by(_(0)))
    val rooms = (0 until n).map(MeetingRoom(_))
  
    val freeRooms = mutable.PriorityQueue.from(rooms)((a, b) => b.roomNumber - a.roomNumber)
    val occupiedRooms = mutable.PriorityQueue.empty[MeetingRoom](
      (a, b) =>
        if (a.lastMeetingEndTime == b.lastMeetingEndTime) b.roomNumber - a.roomNumber
        else b.lastMeetingEndTime - a.lastMeetingEndTime
    )
  
    for (Array(start, end) <- meetings)
      // check if rooms can be freed
      while (occupiedRooms.nonEmpty && occupiedRooms.head.lastMeetingEndTime <= start)
        freeRooms.addOne(occupiedRooms.dequeue)
  
      val room = if (freeRooms.nonEmpty) freeRooms.dequeue else occupiedRooms.dequeue
      room.lastMeetingEndTime = math.max(room.lastMeetingEndTime, start) + end - start // start time with possible delay + duration
      room.meetingsHeld += 1
      occupiedRooms.addOne(room)
  
    rooms.maxBy(_.meetingsHeld).roomNumber