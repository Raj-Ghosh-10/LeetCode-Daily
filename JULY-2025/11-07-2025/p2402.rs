impl Solution {
    pub fn most_booked(n: i32, mut meetings: Vec<Vec<i32>>) -> i32 {
        meetings.sort_unstable_by_key(|meeting| meeting[0]);

        #[derive(PartialEq, Eq, PartialOrd, Ord)]
        struct OnGoingMeeting {
            end_time: u64,
            room: i32,
        }

        let mut avail_rooms: BinaryHeap<_> = (0..n).map(Reverse).collect();
        let mut on_going_meetings = BinaryHeap::<Reverse<OnGoingMeeting>>::new();
        let mut room_use_counts = vec![0; n as _];

        for meeting in meetings {
            // Forward time
            let free_rooms = iter::from_fn(|| {
                if on_going_meetings.peek()?.0.end_time <= meeting[0] as _ {
                    on_going_meetings
                        .pop()
                        .map(|Reverse(OnGoingMeeting { room, .. })| Reverse(room))
                } else {
                    None
                }
            });
            avail_rooms.extend(free_rooms);

            // Find a suitable room
            match avail_rooms.pop() {
                Some(Reverse(avail_room)) => {
                    room_use_counts[avail_room as usize] += 1;
                    on_going_meetings.push(Reverse(OnGoingMeeting {
                        end_time: meeting[1] as _,
                        room: avail_room,
                    }));
                }
                None => {
                    let Reverse(OnGoingMeeting {
                        room: avail_room,
                        end_time,
                    }) = on_going_meetings.pop().unwrap();

                    room_use_counts[avail_room as usize] += 1;
                    on_going_meetings.push(Reverse(OnGoingMeeting {
                        end_time: meeting[1] as u64 + end_time - meeting[0] as u64,
                        room: avail_room,
                    }))
                }
            }
        }

        room_use_counts
            .into_iter()
            .enumerate()
            .rev()
            .max_by_key(|&(_, room_use_count)| room_use_count)
            .map(|(i, _)| i as i32)
            .unwrap()
    }
}

use std::{cmp::Reverse, collections::BinaryHeap, iter};