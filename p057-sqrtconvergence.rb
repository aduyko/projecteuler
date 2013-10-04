$fractions=[]
def expand(iter)
  if iter==0 ; return 0 end
  a = Rational(1,2+expand(iter-1))
  $fractions.push(Rational(1,1)+a)
  a
end

target = 1000
answer = 0
expand(target)
$fractions.each { |r|
  if r.numerator.to_s.length>r.denominator.to_s.length ; answer+=1 end
}
puts answer