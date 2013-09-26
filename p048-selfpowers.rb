target = 1000
sum = 0
(1..target).each { |i|
  sum+=i**i
}
puts sum.to_s[-10..-1]