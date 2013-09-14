nums=[]
(2..500000).each { |i|
  digits=i.to_s.split("").map { |i| i.to_i**5 } .inject(:+)
  if digits==i ; nums.push(i) end
}
nums.each { |i|
  puts "#{i}: #{i.to_s.split("").map { |j| j.to_i**5 }}"
}
print nums.inject(:+)