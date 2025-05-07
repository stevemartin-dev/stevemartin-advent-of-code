def count_min_combinations(containers, target)
  # First, find the minimum number of containers needed
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

  # Then, count all combinations with min_containers that sum to target
  count = 0
  containers.combination(min_containers).each do |combo|
    count += 1 if combo.sum == target
  end
  count
end

# Container sizes from input
containers = [
  50, 44, 11, 49, 42, 46, 18, 32, 26, 40,
  21, 7, 18, 43, 10, 47, 36, 24, 22, 40
]

# Target amount of eggnog to store
target = 150

# Calculate and print the number of minimal combinations
puts count_min_combinations(containers, target)