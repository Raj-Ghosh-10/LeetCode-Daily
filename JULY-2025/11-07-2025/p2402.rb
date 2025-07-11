# @param {Integer} n
# @param {Integer[][]} meetings
# @return {Integer}
def most_booked(n, meetings)
    SimulateMeetingsRoom.new(n, meetings).call
end

class SimulateMeetingsRoom
    attr_reader :meetings, :rooms, :rooms_count

    def initialize(rooms_count, meetings)
        @rooms_count = rooms_count
        @meetings = meetings.sort_by(&:first)

        @rooms = Array.new(rooms_count) { |i| MeetingRoom.new(i) }
    end

    def call
        while meetings.any?
            start_time, end_time = meetings.shift
            release_rooms(start_time)
            room = rooms.shift

            room.book!(start_time, end_time)
            add_room_back(room)
        end
        find_most_used_room
    end

    private

    def release_rooms(start_time)
        index = 0
        while index < rooms_count && rooms[index].next_time <= start_time
            if rooms[index].next_time != 0
                room = rooms.delete_at(index)
                room.release
                add_room_back(room)
            end
            index += 1
        end
    end

    def add_room_back(room)
        queue_index = rooms.bsearch_index do |r|
            r.next_time > room.next_time || 
                (r.next_time == room.next_time && r.name > room.name)
        end || rooms.length
        rooms.insert(queue_index, room)
    end

    def find_most_used_room
        result = rooms.first

        rooms.each do |room|
            if room.meetings_count > result.meetings_count || (room.meetings_count == result.meetings_count && room.name < result.name)
                result = room
            end
        end

        result.name
    end
end

class MeetingRoom
    attr_reader :name, :next_time, :meetings_count

    def initialize(name)
        @name = name
        @next_time = 0
        @meetings_count = 0
    end

    def book!(start_time, finish_time)
        if start_time < @next_time
            @next_time = finish_time + @next_time - start_time
        else
            @next_time = finish_time
        end
        @meetings_count += 1
    end

    def release
        @next_time = 0
    end
end