target = 1000
results = Array.new(target+1) { 0 }
(1..target/2).each { |i|
  (i..target).each { |j|
    sum = i+j+Math.sqrt(i*i+j*j)
    if sum>target ; break end
    if sum==sum.floor ; results[sum]+=1 end
  }
  if Math.sqrt(i*i+i*i)>target ; break end
}
puts results.index(results.max)