target = 1000000
sum = 0
(1..target).each { |i|
  s = i.to_s
  if s==s.reverse
    s = i.to_s(2)
    if s==s.reverse ; sum+=i end
  end
}
puts sum