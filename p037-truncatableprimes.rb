require_relative 'equations'

def isTrunc(n)
  if !isPrime(n) ; return 0 end
  s=n.to_s
  f=s[0..-2]
  until f.length==0
    if !isPrime(f.to_i) ; return 0 end
    f=f[0..-2]
  end
  f=s[1..-1]
  until f.length==0
    if !isPrime(f.to_i) ; return 0 end
    f=f[1..-1]
  end
  return n
end

target = 11
answer=[]
i=10
until answer.length==target
  trunc=isTrunc(i)
  if trunc!=0 ; answer.push(trunc) end
  i+=1
end
puts answer.inject(:+)