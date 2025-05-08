def next_password(current_password)
  password = current_password.dup
  loop do
    password = increment_password(password)
    break if valid_password?(password)
  end
  password
end

def increment_password(password)
  chars = password.chars
  i = chars.length - 1
  while i >= 0
    if chars[i] == 'z'
      chars[i] = 'a'
      i -= 1
    else
      chars[i] = (chars[i].ord + 1).chr
      break
    end
  end
  chars.join
end

def valid_password?(password)
  has_straight = false
  (0..password.length - 3).each do |i|
    if password[i].ord + 1 == password[i+1].ord && password[i+1].ord + 1 == password[i+2].ord
      has_straight = true
      break
    end
  end

  forbidden_letters = ['i', 'o', 'l']
  has_no_forbidden = forbidden_letters.none? { |c| password.include?(c) }

  pairs = []
  i = 0
  while i < password.length - 1
    if password[i] == password[i+1]
      pairs << password[i]
      i += 2
    else
      i += 1
    end
  end
  has_two_pairs = pairs.uniq.size >= 2

  has_straight && has_no_forbidden && has_two_pairs
end

current_password = "cqjxjnds"
puts next_password(current_password)