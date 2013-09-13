def isPrime(n)
  if n<=0;        return false end
  if n==1;        return false end
  if n<4;         return true end
  if n%2==0;      return false end
  if n<9;         return true end
  if n%3==0;      return false end
  r=Math.sqrt(n).floor
  f=5
  while f<=r
    if n%f==0;  return false end
    if n%(f+2)==0; return false end
    f=f+6
  end
  return true
end

max = 1000
big_n = 0
product = 0
(-max+1...max).select { |a| a.odd? } .each { |a|
  (-max+1...max).select { |b| b.odd? } .each { |b|
    n = 0
    while isPrime(n**2+a*n+b) ; n+=1 ; end
    if n>big_n ; big_n = n ; product = a*b end
  }
}
puts "#{product}"