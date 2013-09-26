require_relative 'equations'

target = 1000000
primes = genPrimes(target)

answer = 0
maxlen = 0
primes.each_index { |i|
  if i==primes.length-1 ; next end
  solution = []
  solution.push(primes[i])
  counter = i+1
  while solution.inject(:+) <= target
    if isPrime(solution.inject(:+)) && solution.length > maxlen
      maxlen = solution.length
      answer = solution.inject(:+)
    end
    solution.push(primes[counter])
    counter+=1
  end
}
puts answer