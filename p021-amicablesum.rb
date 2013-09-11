def sumDivisors(n)
  sum=0
  (1..n/2.floor).each{ |i|
    if n%i==0 ; sum+=i end
  }
  return sum
end
target=10000
untested=Array.new(target) { i=true }
sum=0
(2...target).each { |i|
  if untested[i]
    sumOne=sumDivisors(i)
    sumTwo=sumDivisors(sumOne)
    if sumTwo==i and sumOne!=sumTwo
      sum+=i
      if sumOne<target ; sum+=sumOne end 
    end
    untested[i]=false
    untested[sumOne]=false
  end
}
print sum