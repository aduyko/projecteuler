target = 100
max = 0
(1..target).each { |i|
  (1..target).each { |j|
    sum = (i**j).to_s.split("").map { |n| n.to_i } .inject(:+)
    if sum>max ; max = sum end
  }
}
puts max