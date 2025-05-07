def find_lowest_house_part_two(target_presents)
  max_elf = target_presents / 11
  max_house = target_presents

  houses = Array.new(max_house + 1, 0)

  (1..max_elf).each do |elf|
    max_visit = elf * 50
    (elf..max_visit).step(elf).take(50).each do |house|
      next if house > max_house
      houses[house] += elf * 11
    end
  end

  houses.each_with_index do |presents, house|
    return house if presents >= target_presents && house > 0
  end

  find_lowest_house_part_two(target_presents * 2)
end

puts find_lowest_house_part_two(33100000)