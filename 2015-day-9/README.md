# Day 9: All in a Single Night

This solution solves both parts of Day 9's Advent of Code challenge about Santa's route planning.

## Problem Description

### Part 1

Every year, Santa delivers all presents in a single night. This year he has new locations to visit with given distances between every pair. He must visit each location exactly once and can start/end at any two different locations. Find the shortest possible route distance.

**Example:**
London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141

Possible routes:
- Dublin -> London -> Belfast = 982
- London -> Dublin -> Belfast = 605
- London -> Belfast -> Dublin = 659
- Dublin -> Belfast -> London = 659
- Belfast -> Dublin -> London = 605
- Belfast -> London -> Dublin = 982

Shortest route: 605

### Part 2

The next year, Santa decides to take the route with the longest distance instead, while still visiting each location exactly once.

**Using the same example:**
Longest route would be 982 (e.g., Dublin -> London -> Belfast)

## Solution

### Approach

- Generate all possible permutations of routes
- Calculate total distance for each route
- Find the minimum (Part 1) or maximum (Part 2) distance

### Ruby Implementation

#### Part 1 Solution
```
def shortest_route(distances)
  locations = distances.keys.flatten.uniq
  min_distance = Float::INFINITY

  locations.permutation.each do |route|
    total_distance = 0
    (0..route.length - 2).each do |i|
      from = route[i]
      to = route[i + 1]
      distance = distances[[from, to].sort]
      total_distance += distance
    end
    min_distance = [min_distance, total_distance].min
  end

  min_distance
end

distances = {}
input = <<~INPUT
[Your input here...]
INPUT

input.each_line do |line|
  parts = line.split
  from = parts[0]
  to = parts[2]
  distance = parts[4].to_i
  distances[[from, to].sort] = distance
end

puts shortest_route(distances)
Part 2 Solution
def longest_route(distances)
  locations = distances.keys.flatten.uniq
  max_distance = 0

  locations.permutation.each do |route|
    total_distance = 0
    (0..route.length - 2).each do |i|
      from = route[i]
      to = route[i + 1]
      distance = distances[[from, to].sort]
      total_distance += distance
    end
    max_distance = [max_distance, total_distance].max
  end

  max_distance
end

puts longest_route(distances)
```

## Development Notes  
- **AI Use**:  
  - Generated `README.md` boilerplate  
  - Verified time/space complexity  
- **Manual Work**:  
  - Core algorithms & implementation (simple Ruby solutions sufficed)  