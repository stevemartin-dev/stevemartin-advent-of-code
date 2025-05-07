def find_lowest_house_part_two(target_presents)
  max_elf = target_presents / 11 # Initial estimate for maximum elf we might need
  max_house = target_presents    # Initial estimate for maximum house we might need

  houses = Array.new(max_house + 1, 0)

  (1..max_elf).each do |elf|
    # Each elf visits at most 50 houses: elf*1, elf*2, ..., elf*50
    max_visit = elf * 50
    (elf..max_visit).step(elf).take(50).each do |house|
      next if house > max_house
      houses[house] += elf * 11
    end
  end

  # Find the first house that meets or exceeds the target
  houses.each_with_index do |presents, house|
    return house if presents >= target_presents && house > 0
  end

  # If we didn't find it, try again with larger bounds
  find_lowest_house_part_two(target_presents * 2)
end

# Example usage:
puts find_lowest_house_part_two(33100000) # Should return different value than part 1
# puts find_lowest_house_part_two(YOUR_INPUT_NUMBER)