def find_lowest_house(target_presents)
  target = target_presents / 10
  return 1 if target <= 1

  max_house = target
  houses = Array.new(max_house + 1, 0)

  (1..max_house).each do |elf|
    (elf..max_house).step(elf) do |house|
      houses[house] += elf
    end
    if elf >= 1 && houses[elf] * 10 >= target_presents
      return elf
    end
  end

  find_lowest_house(target_presents * 2)
end

puts find_lowest_house(33100000)