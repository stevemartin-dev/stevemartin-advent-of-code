def find_lowest_house(target_presents)
  target = target_presents / 10 # Since each elf delivers 10*elf_num presents
  return 1 if target <= 1

  # We'll use a sieve-like approach to accumulate presents for each house
  max_house = target # Initial guess, we'll adjust if needed
  houses = Array.new(max_house + 1, 0)

  (1..max_house).each do |elf|
    (elf..max_house).step(elf) do |house|
      houses[house] += elf
    end
    # Check if we've found our answer
    if elf >= 1 && houses[elf] * 10 >= target_presents
      return elf
    end
  end

  # If we didn't find in initial max_house, double and try again
  find_lowest_house(target_presents * 2)
end

# Example usage:
puts find_lowest_house(33100000) # Should return 8 based on the example
# puts find_lowest_house(YOUR_INPUT_NUMBER)