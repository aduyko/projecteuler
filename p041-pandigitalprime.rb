require_relative 'equations'

@answer=0
def gen(ary,options,used,maxlen)
  if ary.length==maxlen
    num=ary.join.to_i
    if isPrime(num) && num>@answer ; @answer = num end
    return
  end
  usable=options-used
  usable.each { |i|
    ary.push(i)
    used.push(i)
    gen(ary,options,used,maxlen)
    ary.delete(i)
    used.delete(i)
  }
end
(1..9).each { |i| 
  options=(1..i).to_a.reverse
  result=[]
  used=[]
  gen(result,options,used,i)
}

puts @answer