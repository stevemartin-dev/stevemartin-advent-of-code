# Day 10: Elves Look, Elves Say

This solution solves both parts of Day 10's Advent of Code challenge about the look-and-say sequence.

## Problem Description

### Part 1

The Elves play a look-and-say game where each sequence is generated by reading the previous sequence:
- Read the digits of the previous sequence, counting the number of digits in groups
- For each group, write down the count followed by the digit
- Use this as the next sequence in the sequence

**Example:**

1 → 11

11 → 21

21 → 1211

1211 → 111221

111221 → 312211


Starting with your puzzle input, apply this process 40 times. What is the length of the result?

### Part 2

Starting again with the same input, apply the look-and-say process 50 times. What is the length of the new result?

## Solution

### Approach

- Iterate through the current sequence, counting consecutive digits
- For each group of consecutive digits, append the count followed by the digit to form the next sequence
- Repeat for the specified number of iterations
- Return the length of the final sequence

### Ruby Implementation

#### Shared Look-and-Say Function
```
def look_and_say(sequence, iterations)
  iterations.times do
    new_sequence = []
    i = 0
    while i < sequence.length
      current_char = sequence[i]
      count = 1
      while i + 1 < sequence.length && sequence[i+1] == current_char
        count += 1
        i += 1
      end
      new_sequence << count.to_s << current_char
      i += 1
    end
    sequence = new_sequence.join
  end
  sequence
end
```


Part 1 Solution
```
initial_sequence = "3113322113"
iterations = 40
result = look_and_say(initial_sequence, iterations)
puts result.length
```
Part 2 Solution
```
initial_sequence = "3113322113"
iterations = 50
result = look_and_say(initial_sequence, iterations)
puts result.length
```

## Development Notes  
- **AI Use**:  
  - Generated `README.md` boilerplate  
  - Verified time/space complexity  
- **Manual Work**:  
  - Core algorithms & implementation (simple Ruby solutions sufficed)  