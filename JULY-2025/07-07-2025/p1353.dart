import 'package:collection/priority_queue.dart';
import 'dart:math'; 

class Solution {
  int maxEvents(List<List<int>> events) {

    events.sort((a, b) => a[0].compareTo(b[0]));

    final PriorityQueue<int> minHeap = PriorityQueue<int>((a, b) => a.compareTo(b));

    int attendedEvents = 0;
    int eventIndex = 0; // Pointer to the next event to consider from the sorted list
    int n = events.length;
    int maxEndDay = 0;

    if (n > 0) {
      for (var event in events) {
        maxEndDay = max(maxEndDay, event[1]);
      }
    } 
    else {
      return 0; // No events, so 0 attended.
    }

    for (int day = 1; day <= maxEndDay; day++) {
   
      while (eventIndex < n && events[eventIndex][0] == day) {
        minHeap.add(events[eventIndex][1]); // Add the event's end day
        eventIndex++;
      }

      while (minHeap.isNotEmpty && minHeap.first < day) {
        minHeap.removeFirst(); // Use removeFirst() for PriorityQueue from 'collection'
      }

      if (minHeap.isNotEmpty) {
        minHeap.removeFirst(); // Attend this event (remove it from consideration)
        attendedEvents++;
      }

      // Optimization
      if (eventIndex == n && minHeap.isEmpty) {
        break;
      }
    }

    return attendedEvents;
  }
}