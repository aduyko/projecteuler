target = (1..9).to_a.join
max = 10000
products = []
range = (1..max).select { |i| i%5!=0 ; i%10!=1 }
range.each { |i|
  (i..max).each { |j|
    str = (i.to_s+j.to_s+(i*j).to_s).chars.sort.join
    if str.length > target.length ; break end
    if str == target ; products.push(i*j) end
  }
}
puts products.uniq.inject(:+)