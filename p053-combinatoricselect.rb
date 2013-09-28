require_relative 'equations'

target = 100
answer = 0
(1..target).each { |i|
  (1..i).each { |j|
    solution =  factorial(i)/(factorial(j)*factorial(i-j))
    if solution > 1000000 ; answer += 1 end
  }
}
puts answer
