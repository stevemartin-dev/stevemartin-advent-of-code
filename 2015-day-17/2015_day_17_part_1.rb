def count_combinations(containers, target)
  count = 0
  (1..containers.size).each do |k|
    containers.combination(k).each do |combo|
      count += 1 if combo.sum == target
    end
  end
  count
end

# Example usage:
containers = [
  50, 44, 11, 49, 42, 46, 18, 32, 26, 40,
  21, 7, 18, 43, 10, 47, 36, 24, 22, 40
]

# Target amount of eggnog to store
target = 150
puts count_combinations(containers, target) # Should output 4 for the example

# For the actual problem (assuming containers are provided as input):
# containers = [/* list of container sizes */]
# target = 150
# puts count_combinations(containers, target)