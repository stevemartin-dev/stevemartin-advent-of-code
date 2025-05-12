Day 14: Reindeer Olympics
=========================

This solution tackles both parts of Day 14's Advent of Code challenge, focusing on simulating reindeer races with alternating flying and resting phases.

Problem Description
-------------------

### Part 1

Each reindeer flies at a specific speed for a given duration, then rests for another period. The reindeer repeat this cycle throughout the race.

**Goal**: After a total of 2503 seconds, determine the maximum distance traveled by any reindeer.

**Example**:

*   Comet can fly 14 km/s for 10 seconds, then must rest for 127 seconds.
    
*   Dancer can fly 16 km/s for 11 seconds, then must rest for 162 seconds.
    

In 1000 seconds:

*   Comet travels 1120 km
    
*   Dancer travels 1056 km**Result**: Comet wins with 1120 km.
    

### Part 2

Instead of simply measuring distance, Santa awards **points**:

*   At the end of every second, the reindeer in the lead gains a point.
    
*   If there's a tie, all leaders receive a point.
    

**Goal**: After 2503 seconds, determine which reindeer has accumulated the most points.

**Example**:

*   After 1000 seconds:
    
    *   Dancer: 689 points
        
    *   Comet: 312 points**Result**: Dancer wins with 689 points.
        

Solution
--------

### Approach

*   **Part 1**:
    
    *   Parse the input to extract each reindeer's stats.
        
    *   Simulate their flight/rest cycles over 2503 seconds.
        
    *   Track and compare total distances.
        
*   **Part 2**:
    
    *   Simulate the race second-by-second.
        
    *   Track each reindeer's current state, distance, and points.
        
    *   Award points to leading reindeer at each second.
        

### Ruby Implementation

# Part 1: Distance-Based Winner
```
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
```

# Part 2: Point-Based Winner
```
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
```

Development Notes
-----------------

AI assistance was used for:

*   Structuring the simulation logic in Ruby
    
*   Ensuring accurate state transitions between flying and resting
    
*   Optimizing per-second simulation for point tracking in Part 2
    

The input parsing and core logic design were manually crafted to fit the problem's needs and ensure clarity in the simulation flow.