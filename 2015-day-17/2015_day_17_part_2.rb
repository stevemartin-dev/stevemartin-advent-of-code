def count_min_combinations(containers, target)
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

  count = 0
  containers.combination(min_containers).each do |combo|
    count += 1 if combo.sum == target
  end
  count
end

containers = [
  50, 44, 11, 49, 42, 46, 18, 32, 26, 40,
  21, 7, 18, 43, 10, 47, 36, 24, 22, 40
]

target = 150

puts count_min_combinations(containers, target)