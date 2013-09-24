@answer = 0
def gen(ary,options,used,maxlen)
  case ary.length
  when 1
    if ary[0].to_i==0 ; return end
  when 4
    if ary[1..-1].join.to_i.odd? ; return end
  when 5
    if ary[2..-1].join.to_i%3!=0 ; return end
  when 6
    if ary[3..-1].join.to_i%5!=0 ; return end
  when 7
    if ary[4..-1].join.to_i%7!=0 ; return end
  when 8
    if ary[5..-1].join.to_i%11!=0 ; return end
  when 9
    if ary[6..-1].join.to_i%13!=0 ; return end
  when 10
    if ary[7..-1].join.to_i%17!=0 ; return end
  end
  if ary.length==maxlen
    @answer += ary.join.to_i
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

options=(0..9).to_a
result=[]
used=[]
gen(result,options,used,options.length)

puts @answer