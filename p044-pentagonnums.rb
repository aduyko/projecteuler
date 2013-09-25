def isPentagonal?(n)
  math = (Math.sqrt(24*n + 1) + 1)/6
  math==math.floor
end

pent=[]
(1..3000).each { |i|
  pent.push(i*(3*i-1)/2)
  (1..pent.length-2).each { |j|
    unless isPentagonal(pent[j]+pent.last) ; next end
    unless isPentagonal(pent.last-pent[j]) ; next end
    puts "#{pent.last-pent[j]}"
  }
}