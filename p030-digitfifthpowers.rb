nums=[]
(2..500000).each { |i|
  digits=i.to_s.split("").map { |i| i.to_i**5 } .inject(:+)
  if digits==i ; nums.push(i) end
}
print nums.inject(:+)