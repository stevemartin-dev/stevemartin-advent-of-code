# Day 15: Science for Hungry People

You're perfecting your milk-dunking cookie recipe by finding the best balance of ingredients. Each ingredient affects:

Capacity

Durability

Flavor

Texture

Calories

Each property is measured per teaspoon, and the total amount of ingredients must sum to 100 teaspoons.

Your cookie's total score is calculated by:

```
max(0, total capacity) * max(0, total durability) * max(0, total flavor) * max(0, total texture)
```

### Input Ingredients

```
ingredients = [
  { capacity: 3, durability: 0, flavor: 0, texture: -3, calories: 2 },
  { capacity: -3, durability: 3, flavor: 0, texture: 0, calories: 9 },
  { capacity: -1, durability: 0, flavor: 4, texture: 0, calories: 1 },
  { capacity: 0, durability: 0, flavor: -2, texture: 2, calories: 8 }
]
```

## Problem Description

### Part 1

Find the highest possible score with any combination that adds to exactly 100 teaspoons.


# Part 1 Solution
```
def max_cookie_score(ingredients)
  max_score = 0
  (0..100).each do |a|
    (0..100 - a).each do |b|
      (0..100 - a - b).each do |c|
        d = 100 - a - b - c

        capacity = [a * ingredients[0][:capacity] + b * ingredients[1][:capacity] +
                    c * ingredients[2][:capacity] + d * ingredients[3][:capacity], 0].max
        durability = [a * ingredients[0][:durability] + b * ingredients[1][:durability] +
                      c * ingredients[2][:durability] + d * ingredients[3][:durability], 0].max
        flavor = [a * ingredients[0][:flavor] + b * ingredients[1][:flavor] +
                  c * ingredients[2][:flavor] + d * ingredients[3][:flavor], 0].max
        texture = [a * ingredients[0][:texture] + b * ingredients[1][:texture] +
                   c * ingredients[2][:texture] + d * ingredients[3][:texture], 0].max

        score = capacity * durability * flavor * texture
        max_score = [max_score, score].max
      end
    end
  end
  max_score
end

puts max_cookie_score(ingredients)
```

# Part 2 Solution
```
def max_cookie_score_with_calories(ingredients)
  max_score = 0
  (0..100).each do |a|
    (0..100 - a).each do |b|
      (0..100 - a - b).each do |c|
        d = 100 - a - b - c

        calories = a * ingredients[0][:calories] + b * ingredients[1][:calories] +
                   c * ingredients[2][:calories] + d * ingredients[3][:calories]
        next unless calories == 500

        capacity = [a * ingredients[0][:capacity] + b * ingredients[1][:capacity] +
                    c * ingredients[2][:capacity] + d * ingredients[3][:capacity], 0].max
        durability = [a * ingredients[0][:durability] + b * ingredients[1][:durability] +
                      c * ingredients[2][:durability] + d * ingredients[3][:durability], 0].max
        flavor = [a * ingredients[0][:flavor] + b * ingredients[1][:flavor] +
                  c * ingredients[2][:flavor] + d * ingredients[3][:flavor], 0].max
        texture = [a * ingredients[0][:texture] + b * ingredients[1][:texture] +
                   c * ingredients[2][:texture] + d * ingredients[3][:texture], 0].max

        score = capacity * durability * flavor * texture
        max_score = [max_score, score].max
      end
    end
  end
  max_score
end

puts max_cookie_score_with_calories(ingredients)
```

## Development Notes  
- **AI Use**:  
  - Generated `README.md` boilerplate  
  - Verified time/space complexity  
- **Manual Work**:  
  - Core algorithms & implementation (simple Ruby solutions sufficed)  