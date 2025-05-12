# Day 11: Corporate Policy

This solution solves both parts of Day 11's Advent of Code challenge about generating valid passwords according to Santa's corporate policy.

## Problem Description

### Password Requirements

1. **Straight Requirement**: Must contain at least one increasing straight of three consecutive letters (abc, bcd, ..., xyz)
2. **Forbidden Letters**: Cannot contain i, o, or l
3. **Pairs Requirement**: Must contain at least two different non-overlapping pairs of letters (aa, bb, ..., zz)

### Examples

- `hijklmmn`:
  - Contains straight (hij)
  - Contains forbidden letters (i, l)
  
- `abbceffg`:
  - Contains two pairs (bb, ff)
  - No straight of three letters
  
- `abbcegjk`:
  - Only one pair (bb)
  
- Next after `abcdefgh` → `abcdffaa`
- Next after `ghijklmn` → `ghjaabcc` (skips passwords with i)

## Solution Approach

1. **Password Incrementer**:
   - Increment letters right-to-left (like counting)
   - Handles wrap-around from z to a
   - Skips invalid passwords efficiently

2. **Validation Checks**:
   - Check for at least one straight of three consecutive letters
   - Verify no forbidden letters (i, o, l)
   - Confirm at least two different non-overlapping pairs

## Ruby Implementation (Part 1)

```
def next_password(current_password)
  password = current_password.dup
  loop do
    password = increment_password(password)
    break if valid_password?(password)
  end
  password
end

def increment_password(password)
  chars = password.chars
  i = chars.length - 1
  while i >= 0
    if chars[i] == 'z'
      chars[i] = 'a'
      i -= 1
    else
      chars[i] = (chars[i].ord + 1).chr
      break
    end
  end
  chars.join
end

def valid_password?(password)
  has_straight = false
  (0..password.length - 3).each do |i|
    if password[i].ord + 1 == password[i+1].ord && password[i+1].ord + 1 == password[i+2].ord
      has_straight = true
      break
    end
  end

  forbidden_letters = ['i', 'o', 'l']
  has_no_forbidden = forbidden_letters.none? { |c| password.include?(c) }

  pairs = []
  i = 0
  while i < password.length - 1
    if password[i] == password[i+1]
      pairs << password[i]
      i += 2
    else
      i += 1
    end
  end
  has_two_pairs = pairs.uniq.size >= 2

  has_straight && has_no_forbidden && has_two_pairs
end

current_password = "cqjxjnds"
puts next_password(current_password)
```
## Ruby Implementation (Part 2)

```
def next_password(current_password)
  password = current_password.dup
  valid_count = 0
  loop do
    password = increment_password(password)
    if valid_password?(password)
      valid_count += 1
      break if valid_count == 2
    end
  end
  password
end

def increment_password(password)
  chars = password.chars
  i = chars.length - 1
  while i >= 0
    if chars[i] == 'z'
      chars[i] = 'a'
      i -= 1
    else
      chars[i] = (chars[i].ord + 1).chr
      break
    end
  end
  chars.join
end

def valid_password?(password)
  has_straight = false
  (0..password.length - 3).each do |i|
    if password[i].ord + 1 == password[i+1].ord && password[i+1].ord + 1 == password[i+2].ord
      has_straight = true
      break
    end
  end

  forbidden_letters = ['i', 'o', 'l']
  has_no_forbidden = forbidden_letters.none? { |c| password.include?(c) }

  pairs = []
  i = 0
  while i < password.length - 1
    if password[i] == password[i+1]
      pairs << password[i]
      i += 2
    else
      i += 1
    end
  end
  has_two_pairs = pairs.uniq.size >= 2

  has_straight && has_no_forbidden && has_two_pairs
end

current_password = "cqjxjnds"
puts next_password(current_password)
```

## Development Notes  
- **AI Use**:  
  - Generated `README.md` boilerplate  
  - Verified time/space complexity  
- **Manual Work**:  
  - Core algorithms & implementation (simple Ruby solutions sufficed)  