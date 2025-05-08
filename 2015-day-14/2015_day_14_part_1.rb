def winning_reindeer_distance(input, total_seconds)
  reindeers = input.split("\n").map do |line|
    parts = line.split
    {
      name: parts[0],
      speed: parts[3].to_i,
      fly_time: parts[6].to_i,
      rest_time: parts[13].to_i
    }
  end

  max_distance = 0

  reindeers.each do |reindeer|
    distance = 0
    time_remaining = total_seconds
    flying = true
    fly_time_remaining = reindeer[:fly_time]
    rest_time_remaining = 0

    while time_remaining > 0
      if flying
        time_possible = [fly_time_remaining, time_remaining].min
        distance += reindeer[:speed] * time_possible
        time_remaining -= time_possible
        fly_time_remaining -= time_possible
        if fly_time_remaining == 0
          flying = false
          rest_time_remaining = reindeer[:rest_time]
        end
      else
        time_possible = [rest_time_remaining, time_remaining].min
        time_remaining -= time_possible
        rest_time_remaining -= time_possible
        if rest_time_remaining == 0
          flying = true
          fly_time_remaining = reindeer[:fly_time]
        end
      end
    end

    max_distance = [max_distance, distance].max
  end

  max_distance
end

input = <<~INPUT
Rudolph can fly 22 km/s for 8 seconds, but then must rest for 165 seconds.
Cupid can fly 8 km/s for 17 seconds, but then must rest for 114 seconds.
Prancer can fly 18 km/s for 6 seconds, but then must rest for 103 seconds.
Donner can fly 25 km/s for 6 seconds, but then must rest for 145 seconds.
Dasher can fly 11 km/s for 12 seconds, but then must rest for 125 seconds.
Comet can fly 21 km/s for 6 seconds, but then must rest for 121 seconds.
Blitzen can fly 18 km/s for 3 seconds, but then must rest for 50 seconds.
Vixen can fly 20 km/s for 4 seconds, but then must rest for 75 seconds.
Dancer can fly 7 km/s for 20 seconds, but then must rest for 119 seconds.
INPUT

total_seconds = 2503
puts winning_reindeer_distance(input, total_seconds)