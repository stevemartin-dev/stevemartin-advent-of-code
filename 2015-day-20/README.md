# Day 20: Infinite Elves and Infinite Houses

This solution solves both parts of Day 20's Advent of Code challenge about elf present delivery optimization.

## Problem Description

### Part 1

Elves deliver presents to houses based on their number:
- Elf n delivers to every nth house (n, 2n, 3n,...)
- Each delivery is worth 10× the elf's number
- Find the first house receiving at least the target number of presents (33,100,000)

**Example:**
House 1: 10 (from Elf 1)
House 2: 30 (10 from Elf 1 + 20 from Elf 2)
House 3: 40 (10 + 0 + 30)
House 4: 70 (10 + 20 + 0 + 40)


### Part 2

Modified rules:
- Each elf delivers to only first 50 houses they would visit
- Each delivery is worth 11× their number
- Find the first house meeting the same target

## Solution Approach

### Part 1 Algorithm
1. Initialize array to track presents per house
2. For each elf, add presents to all its multiples
3. Check after each elf if any house meets the target
4. If not found, double search range and retry

### Part 2 Algorithm
1. Similar array initialization
2. For each elf, add presents to first 50 multiples
3. Check houses in order for the target
4. Expand search if not found

## Ruby Implementation

```
# Part 1 Solution
def find_lowest_house(target_presents)
  target = target_presents / 10
  return 1 if target <= 1

  max_house = target
  houses = Array.new(max_house + 1, 0)

  (1..max_house).each do |elf|
    (elf..max_house).step(elf) do |house|
      houses[house] += elf
    end
    if elf >= 1 && houses[elf] * 10 >= target_presents
      return elf
    end
  end

  find_lowest_house(target_presents * 2)
end

puts "Part 1: #{find_lowest_house(33100000)}"

# Part 2 Solution
def find_lowest_house_part_two(target_presents)
  max_elf = target_presents / 11
  max_house = target_presents

  houses = Array.new(max_house + 1, 0)

  (1..max_elf).each do |elf|
    max_visit = elf * 50
    (elf..max_visit).step(elf).take(50).each do |house|
      next if house > max_house
      houses[house] += elf * 11
    end
  end

  houses.each_with_index do |presents, house|
    return house if presents >= target_presents && house > 0
  end

  find_lowest_house_part_two(target_presents * 2)
end

puts "Part 2: #{find_lowest_house_part_two(33100000)}"
```

## Development Notes  
- **AI Use**:  
  - Generated `README.md` boilerplate  
  - Verified time/space complexity  
- **Manual Work**:  
  - Core algorithms & implementation (simple Ruby solutions sufficed)  