def winning_reindeer_points(input, total_seconds)
  reindeers = input.split("\n").map do |line|
    parts = line.split
    {
      name: parts[0],
      speed: parts[3].to_i,
      fly_time: parts[6].to_i,
      rest_time: parts[13].to_i,
      distance: 0,
      points: 0,
      flying: true,
      time_in_mode: 0
    }
  end

  total_seconds.times do |current_second|
    reindeers.each do |reindeer|
      if reindeer[:flying]
        reindeer[:distance] += reindeer[:speed]
        reindeer[:time_in_mode] += 1
        if reindeer[:time_in_mode] == reindeer[:fly_time]
          reindeer[:flying] = false
          reindeer[:time_in_mode] = 0
        end
      else
        reindeer[:time_in_mode] += 1
        if reindeer[:time_in_mode] == reindeer[:rest_time]
          reindeer[:flying] = true
          reindeer[:time_in_mode] = 0
        end
      end
    end

    max_distance = reindeers.map { |r| r[:distance] }.max
    reindeers.each do |reindeer|
      reindeer[:points] += 1 if reindeer[:distance] == max_distance
    end
  end

  reindeers.map { |r| r[:points] }.max
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
puts winning_reindeer_points(input, total_seconds)