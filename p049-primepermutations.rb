require_relative 'equations'

primes = genPrimes(10000).delete_if { |i| i<1000 }
sorted = primes.each_with_index.map { |i,idx| i.to_s.split("").sort.join << idx.to_s } .sort

#get all primes that are permutations of each other
perms = []
i = 0
until i==sorted.length-1
  curnum = sorted[i][0..3]
  start = i
  count = 1
  i+=1
  while sorted[i][0..3]==curnum
    count+=1
    i+=1
  end
  if count>=3
    set = []
    (start...i).each { |n|
      set.push(primes[sorted[n][4..-1].to_i])
    }
    perms.push(set.sort.reverse)
  end
end
#gross loop!!! but its efficient with our small data
answers = []
perms.each { |a|
  a.each_index { |i|
    if i==a.length-2 ; next end
    (i+1..a.length-2).each { |j|
      first = a[i]-a[j]
      (j+1..a.length-1).each { |k| 
        second = a[j]-a[k]
        if first==second ; answers.push(a[k].to_s<<a[j].to_s<<a[i].to_s) end
      }
    }
  }
}
puts answers