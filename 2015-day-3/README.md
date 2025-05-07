# Day 3: Perfectly Spherical Houses in a Vacuum

This repository contains solutions to both parts of Day 3's Advent of Code challenge.

## Problem Description

### Part 1
Santa delivers presents to houses on an infinite 2D grid based on movement instructions (^, v, >, <). Each movement updates his position, and he delivers a present to the house at his new location. The task is to determine how many unique houses receive at least one present.

**Example:**
- `>` delivers to 2 houses
- `^>v<` delivers to 4 houses
- `^v^v^v^v^v` delivers to 2 houses

### Part 2
Santa is now assisted by Robo-Santa. They take turns following the movement instructions. The task is to determine how many unique houses receive at least one present when both Santa and Robo-Santa are delivering.

**Example:**
- `^v` delivers to 3 houses
- `^>v<` delivers to 3 houses
- `^v^v^v^v^v` delivers to 11 houses

## Solution

### Approach
- **Part 1**: Track Santa's position after each move and record all visited houses in a hash where keys are coordinate pairs.
- **Part 2**: Track both Santa's and Robo-Santa's positions, alternating moves between them, and record all visited houses.

### Ruby Implementation

```ruby
# Part 1 Solution
def count_houses_with_presents(directions)
  x, y = 0, 0
  visited = { [x, y] => true }

  directions.each_char do |direction|
    case direction
    when '^' then y += 1
    when 'v' then y -= 1
    when '>' then x += 1
    when '<' then x -= 1
    end
    visited[[x, y]] = true
  end

  visited.size
end

# Part 2 Solution
def count_houses_with_presents(directions)
  santa_x, santa_y = 0, 0
  robo_x, robo_y = 0, 0
  visited = { [santa_x, santa_y] => true }

  directions.each_char.with_index do |direction, index|
    if index.even?
      # Santa moves
      case direction
      when '^' then santa_y += 1
      when 'v' then santa_y -= 1
      when '>' then santa_x += 1
      when '<' then santa_x -= 1
      end
      visited[[santa_x, santa_y]] = true
    else
      # Robo-Santa moves
      case direction
      when '^' then robo_y += 1
      when 'v' then robo_y -= 1
      when '>' then robo_x += 1
      when '<' then robo_x -= 1
      end
      visited[[robo_x, robo_y]] = true
    end
  end

  visited.size
end
```
## Development Notes

AI assistance was limited to:
1. Initial code formatting
2. README structure suggestion