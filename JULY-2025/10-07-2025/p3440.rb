def max_free_time(event_time, start_time, end_time)
  n = start_time.length
  return event_time if n == 0

  gaps = Array.new(n + 1, 0)
  gaps[0] = start_time[0]
  (1...n).each { |i| gaps[i] = start_time[i] - end_time[i - 1] }
  gaps[n] = event_time - end_time[n - 1]

  largest_right = Array.new(n + 1, 0)
  (n - 1).downto(0) do |i|
    largest_right[i] = [largest_right[i + 1], gaps[i + 1]].max
  end

  max_free = 0
  largest_left = 0

  (1..n).each do |i|
    duration = end_time[i - 1] - start_time[i - 1]
    can_fit_left = largest_left >= duration
    can_fit_right = largest_right[i] >= duration

    if can_fit_left || can_fit_right
      merged = gaps[i - 1] + gaps[i] + duration
      max_free = [max_free, merged].max
    end

    current = gaps[i - 1] + gaps[i]
    max_free = [max_free, current].max
    largest_left = [largest_left, gaps[i - 1]].max
  end

  max_free
end