target = 10000
answer = 0
(1..target).each { |n|
  if Math.sqrt(n)%1==0 ; next end
  m = 0
  d = 1
  a = a0 = Math.sqrt(n).floor
  count = 0
  begin
    m = d * a - m
    d = (n - (m**2)) / d
    a = ((a0 + m) / d).floor
    count += 1
  end until d==1
  if count.odd? ; answer += 1 end
}
puts answer