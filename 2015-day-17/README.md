# Day 17: No Such Thing as Too Much

This solution solves both parts of Day 17's Advent of Code challenge about finding container combinations to store eggnog.

## Problem Description

### Part 1
- You have containers of various sizes (given as input)
- Need to store exactly 150 liters of eggnog
- Find how many different combinations of containers can exactly fit 150 liters
- All containers must be filled entirely

**Example:**
- Containers: [20, 15, 10, 5, 5]
- Target: 25 liters
- Solutions:
  - 15 + 10
  - 20 + 5 (first 5)
  - 20 + 5 (second 5)
  - 15 + 5 + 5
- Total combinations: 4

### Part 2
- Find the minimum number of containers needed to store exactly 150 liters
- Count how many different ways you can use that exact number of containers

**Example (continuing from above):**
- Minimum containers: 2 (15+10, 20+5, 20+5)
- Answer: 3 ways

## Solution Approach

### Part 1 Algorithm
1. Generate all possible combinations of containers (from 1 container up to all containers)
2. For each combination, check if the sum equals the target (150 liters)
3. Count all valid combinations

### Part 2 Algorithm
1. First find the smallest number of containers that can sum to 150 liters
2. Then count how many combinations exist using exactly that number of containers

## Ruby Implementation

```
# Part 1 Solution
def count_combinations(containers, target)
  count = 0
  (1..containers.size).each do |k|
    containers.combination(k).each do |combo|
      count += 1 if combo.sum == target
    end
  end
  count
end

# Part 2 Solution
def count_min_combinations(containers, target)
  min_containers = nil
  (1..containers.size).each do |k|
    containers.combination(k).each do |combo|
      if combo.sum == target
        min_containers = k
        break
      end
    end
    break if min_containers
  end

  count = 0
  containers.combination(min_containers).each do |combo|
    count += 1 if combo.sum == target
  end
  count
end

# Input data
containers = [
  50, 44, 11, 49, 42, 46, 18, 32, 26, 40,
  21, 7, 18, 43, 10, 47, 36, 24, 22, 40
]
target = 150

# Solutions
puts "Part 1: #{count_combinations(containers, target)}"
puts "Part 2: #{count_min_combinations(containers, target)}"
```

## Development Notes  
- **AI Use**:  
  - Generated `README.md` boilerplate  
  - Verified time/space complexity  
- **Manual Work**:  
  - Core algorithms & implementation (simple Ruby solutions sufficed)  