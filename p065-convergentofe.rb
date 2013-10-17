target = 99 # array indexed
fraction = 0
target.downto(0).each { |n|
  if n==2 || n==0
    num = 2
  elsif (n - 2) % 3 == 0
    num = ((n - 2) / 3 + 1) * 2
  else
    num = 1
  end

  if n==target
    fraction = Rational(1,num)
  else
    fraction = Rational(1,num+fraction) #comes out upside down (??)
  end
}
puts fraction.denominator.to_s.split('').map { |i| i.to_i } .inject(:+)