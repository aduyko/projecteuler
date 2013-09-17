product=1
(10..99).each { |num|
  if num%10==0 ; next end
  num_first = num/10.floor
  num_second = num%10
  (num+1..99).each { |denom|
    if denom%10==0 ; next end                                 #division by 0
    simplified=Rational(num,denom)
    if simplified.denominator==denom ; next end
    denom_first = denom/10.floor
    denom_second = denom%10
    if   num_first==num_second ||
         denom_first==denom_second ||
         (num_first!=denom_second &&
         denom_first!=num_second)
      next
    end
    if   simplified==Rational(num_first,denom_second) ||
         simplified==Rational(num_second,denom_first) 
      product*=simplified
    end
  }
}
puts product.denominator