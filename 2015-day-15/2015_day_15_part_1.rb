def max_cookie_score(ingredients)
  max_score = 0
  # Generate all possible combinations of amounts for each ingredient that sum to 100
  (0..100).each do |a|
    (0..100 - a).each do |b|
      (0..100 - a - b).each do |c|
        d = 100 - a - b - c
        # Calculate each property's total
        capacity = [a * ingredients[0][:capacity] + b * ingredients[1][:capacity] + c * ingredients[2][:capacity] + d * ingredients[3][:capacity], 0].max
        durability = [a * ingredients[0][:durability] + b * ingredients[1][:durability] + c * ingredients[2][:durability] + d * ingredients[3][:durability], 0].max
        flavor = [a * ingredients[0][:flavor] + b * ingredients[1][:flavor] + c * ingredients[2][:flavor] + d * ingredients[3][:flavor], 0].max
        texture = [a * ingredients[0][:texture] + b * ingredients[1][:texture] + c * ingredients[2][:texture] + d * ingredients[3][:texture], 0].max
        # Calculate the score
        score = capacity * durability * flavor * texture
        max_score = [max_score, score].max
      end
    end
  end
  max_score
end

# Ingredients from the input
ingredients = [
  { capacity: 3, durability: 0, flavor: 0, texture: -3, calories: 2 },
  { capacity: -3, durability: 3, flavor: 0, texture: 0, calories: 9 },
  { capacity: -1, durability: 0, flavor: 4, texture: 0, calories: 1 },
  { capacity: 0, durability: 0, flavor: -2, texture: 2, calories: 8 }
]

puts max_cookie_score(ingredients)