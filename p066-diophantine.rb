target = 1000
answer = 0
answerIdx = 0
(2..target).each { |n|
  if Math.sqrt(n)%1==0 ; next end

  m = 0
  d = 1
  a = a0 = Math.sqrt(n).floor
  ary = [a]

  #convergent fraction equation pushed into array
  begin
    m = d * a - m
    d = (n - (m**2)) / d
    a = ((a0 + m) / d).floor
    ary.push(a)
  end until d==1
  #if the repeating part is odd, array length is even and weird stuff has to be done
  if ary.length.even? 
    period = ary.dup
    period.shift #remove first element
    ary.push(period)
    ary.flatten!
  end
  ary.pop
  
  start = Rational(ary.pop,1)
  while ary.size>0
    start = Rational(ary.pop+Rational(1,start),1)
  end
  if start.numerator > answer 
    answer = start.numerator 
    answerIdx = n 
  end
}
puts answerIdx