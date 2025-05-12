# Day 12: JSAbacusFramework.io

This solution solves both parts of Day 12's Advent of Code challenge about processing JSON data to sum numbers with specific rules.

## Problem Description

### Part 1
- Given a JSON document containing arrays, objects, numbers, and strings
- Find all numbers throughout the document and sum them together
- Strings containing numbers will not be encountered

**Examples:**
- `[1,2,3]` → sum of 6
- `{"a":2,"b":4}` → sum of 6
- `{"a":{"b":4},"c":-1}` → sum of 3
- `{"a":[-1,1]}` → sum of 0

### Part 2
- Additional rule: Ignore any object (and all its children) that has any property with value "red"
- This rule applies only to objects (`{...}`), not arrays (`[...]`)

**Examples:**
- `[1,{"c":"red","b":2},3]` → sum of 4 (middle object ignored)
- `{"d":"red","e":[1,2,3,4],"f":5}` → sum of 0 (entire structure ignored)
- `[1,"red",5]` → sum of 6 ("red" in array has no effect)

## Solution Approach

### Part 1 Algorithm
1. Recursively traverse the JSON structure
2. For numbers: add to sum
3. For arrays: process each element
4. For objects: process each value

### Part 2 Algorithm
1. Same as Part 1 but with additional check for objects:
   - If object contains any value "red", skip entire object
   - Otherwise process normally

## Ruby Implementation

```
require 'json'

# Part 1 Solution
def sum_numbers_part1(data)
  sum = 0
  case data
  when Numeric
    sum += data
  when Array
    data.each { |element| sum += sum_numbers_part1(element) }
  when Hash
    data.each_value { |value| sum += sum_numbers_part1(value) }
  end
  sum
end

# Part 2 Solution
def sum_numbers_part2(data)
  sum = 0
  case data
  when Numeric
    sum += data
  when Array
    data.each { |element| sum += sum_numbers_part2(element) }
  when Hash
    unless data.values.include?("red")
      data.each_value { |value| sum += sum_numbers_part2(value) }
    end
  end
  sum
end

# Example usage:
json_string = '{"a":1,"b":"red","c":{"d":2}}'
data = JSON.parse(json_string)

puts "Part 1 sum: #{sum_numbers_part1(data)}"
puts "Part 2 sum: #{sum_numbers_part2(data)}"
```

## Development Notes  
- **AI Use**:  
  - Generated `README.md` boilerplate  
  - Verified time/space complexity  
- **Manual Work**:  
  - Core algorithms & implementation (simple Ruby solutions sufficed)  