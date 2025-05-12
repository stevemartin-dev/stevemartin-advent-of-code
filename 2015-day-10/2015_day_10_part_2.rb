def look_and_say(sequence, iterations)
  iterations.times do
    new_sequence = []
    i = 0
    while i < sequence.length
      current_char = sequence[i]
      count = 1
      while i + 1 < sequence.length && sequence[i+1] == current_char
        count += 1
        i += 1
      end
      new_sequence << count.to_s << current_char
      i += 1
    end
    sequence = new_sequence.join
  end
  sequence
end

initial_sequence = "3113322113"
iterations = 50
result = look_and_say(initial_sequence, iterations)
puts result.length