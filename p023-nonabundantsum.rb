def isAbundant(n)
  num=n
  sum=1
  p=2
  while p*p<=n and n>1
    if n%p==0
      j=p*p
      n=n/p
      while n%p==0
        j=j*p
        n=n/p
      end
      sum*=(j-1)
      sum/=(p-1)
    end
    if p==2 ; p=3 else p=p+2 end
  end
  if n>1 ; sum*=(n+1) end
  return sum-num>num
end
target = 28123
nums = Array.new(target) { |i| i+1 }
abundant = []
(1..target).each{ |i|
  if isAbundant(i)
    abundant.push(i) 
    abundant.each { |j|
      sum=i+j
      if sum<=target ; nums[sum-1]=0 end
    }
 end
}
print nums.inject(:+)