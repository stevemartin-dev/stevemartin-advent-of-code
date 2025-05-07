# Day 1: Not Quite Lisp

This solution solves both parts of Day 1's Advent of Code challenge about Santa's floor navigation.

## Problem Description

### Part 1
Santa starts on floor 0 and follows instructions consisting of parentheses:
- `(` means go up one floor
- `)` means go down one floor

**Examples:**
- `(())` and `()()` result in floor 0
- `(((` and `(()(()(` result in floor 3  
- `))(((((` results in floor 3
- `())` and `))(` result in floor -1
- `)))` and `)())())` result in floor -3

### Part 2
Find the position of the first character that causes Santa to enter the basement (floor -1). Positions are 1-indexed.

**Examples:**
- `)` enters basement at position 1
- `()())` enters basement at position 5

## Solution

### Approach
- **Part 1**: Iterate through each character, incrementing or decrementing a floor counter
- **Part 2**: Track floor changes and return the first index where floor becomes -1

### Ruby Implementation

```ruby
# Part 1 Solution
def find_floor(instructions)
  floor = 0
  instructions.each_char do |char|
    floor += 1 if char == '('
    floor -= 1 if char == ')'
  end
  floor
end

# Part 2 Solution
def first_basement_position(instructions)
  floor = 0
  instructions.chars.each_with_index do |char, index|
    floor += char == '(' ? 1 : -1
    return index + 1 if floor == -1
  end
  nil
end
```

## Development Notes

AI assistance was only used for:
- Generating the initial README.md boilerplate structure
- Verifying time/space complexity analysis

Core algorithm design and implementation were done manually, as the problems were well-suited to straightforward Ruby solutions without needing optimization hints.