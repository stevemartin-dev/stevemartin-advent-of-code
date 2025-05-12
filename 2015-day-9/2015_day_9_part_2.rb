def longest_route(distances)
  locations = distances.keys.flatten.uniq
  max_distance = 0

  locations.permutation.each do |route|
    total_distance = 0
    (0..route.length - 2).each do |i|
      from = route[i]
      to = route[i + 1]
      distance = distances[[from, to].sort]
      total_distance += distance
    end
    max_distance = [max_distance, total_distance].max
  end

  max_distance
end

distances = {}
input = <<~INPUT
Faerun to Norrath = 129
Faerun to Tristram = 58
Faerun to AlphaCentauri = 13
Faerun to Arbre = 24
Faerun to Snowdin = 60
Faerun to Tambi = 71
Faerun to Straylight = 67
Norrath to Tristram = 142
Norrath to AlphaCentauri = 15
Norrath to Arbre = 135
Norrath to Snowdin = 75
Norrath to Tambi = 82
Norrath to Straylight = 54
Tristram to AlphaCentauri = 118
Tristram to Arbre = 122
Tristram to Snowdin = 103
Tristram to Tambi = 49
Tristram to Straylight = 97
AlphaCentauri to Arbre = 116
AlphaCentauri to Snowdin = 12
AlphaCentauri to Tambi = 18
AlphaCentauri to Straylight = 91
Arbre to Snowdin = 129
Arbre to Tambi = 53
Arbre to Straylight = 40
Snowdin to Tambi = 15
Snowdin to Straylight = 99
Tambi to Straylight = 70
INPUT

input.each_line do |line|
  parts = line.split
  from = parts[0]
  to = parts[2]
  distance = parts[4].to_i
  distances[[from, to].sort] = distance
end

puts longest_route(distances)