require_relative 'equations'

primes = genPrimes(1000)
run = 0
num = 0
target = 4
n = 2
until run==target
  factors = 0
  test = n
  primes.each { |i|
    if test%i==0 ; factors+=1 end
    while test%i==0 ; test/=i end
    if test<i ; break end
  }
  if factors==target 
    run+=1
    num=n 
  else
    run=0
  end
  n+=1
end
puts num+1-target