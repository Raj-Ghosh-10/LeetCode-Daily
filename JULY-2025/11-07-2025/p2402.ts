interface UsedRoomInfo {
    endTime: number;
    room: number;
}
import {
  ICompare
} from '@datastructures-js/priority-queue';

function mostBooked(n: number, meetings: number[][]): number {
    meetings.sort((a, b) => a[0]-b[0]); // sort by start date
    const unusedRooms = new MinPriorityQueue<number>();
    const compareFn: ICompare<UsedRoomInfo> = (a: UsedRoomInfo, b: UsedRoomInfo) => {
        if (a.endTime !== b.endTime) return a.endTime - b.endTime; // earlier finish comes first
        return a.room - b.room; // if same end time, use smaller room index
    };
    const usedRooms = new PriorityQueue<UsedRoomInfo>(compareFn);

    const counts = new Array(n).fill(0);

    // Initially all rooms are free
    for(let i = 0; i< n; i++) unusedRooms.enqueue(i);

    for(const [start, end] of meetings) {

        // Free up rooms that are done
        while(!usedRooms.isEmpty() && usedRooms.front().endTime <= start) {
            const { room } = usedRooms.dequeue();
            unusedRooms.enqueue(room);
        }
        // case1: some rooms are free
        if(!unusedRooms.isEmpty()) {
            const room = unusedRooms.dequeue();
            counts[room]++;
            usedRooms.enqueue({endTime: end, room});
        } else {
            // case2: all rooms are busy
            const { endTime, room} = usedRooms.dequeue();
            counts[room]++;
            const newEnd = endTime + (end - start);
            usedRooms.enqueue({endTime: newEnd, room});
        }
    }

    let maxCount = 0;
    let result = 0;
    for (let i = 0; i < n; i++) {
        if (counts[i] > maxCount || (counts[i] === maxCount && i < result)) {
            maxCount = counts[i];
            result = i;
        }
    }

    return result;
};