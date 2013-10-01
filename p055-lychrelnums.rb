target = 10000
max = 50
count = 0
(1...target).each { |i|
  add=true
  max.times {
    i+=i.to_s.reverse.to_i
    if i==i.to_s.reverse.to_i ; add=false ; break end
  }
  if add ; count += 1 end
}
puts count