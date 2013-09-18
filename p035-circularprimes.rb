def genPrimes(limit)
  crosslimit = Math.sqrt(limit).floor
  sieve = Array.new(limit+1) { |i| false }
  (4..limit).step(2) { |i|
    sieve[i]=true
  }
  (3..crosslimit).step(2) { |i|
    if !sieve[i] 
      (i*i..limit).step(2*i) { |j|
        sieve[j] = true
      }
    end
  }
  sieve[0..1] = [true,true]
  primes=[]
  sieve.each_with_index { |i,idx| 
    if !i ; primes.push idx end
  }
  return primes
end

target = 1000000
primes = genPrimes(target)
#delete all numbers that contain multiples of 2 or 5 as digits
primes.delete_if { |i|
  i.to_s.split("").keep_if { |x| x.to_i%2==0 || x.to_i%5==0 } .length>0
}
rotated = 0
primes.each { |i|
  #if we already counted this prime, next
  if i==0 ; next end
  stop=false
  nums=i.to_s.split("")
  #rotate as many times as the number has digits
  nums.length.times {
    #if the number is like 11111 or something
    if nums==nums.rotate 
      stop=true
      rotated+=1
      break
    end
    #check if rotated number is prime
    num=nums.rotate!.join.to_i
    if !primes.include?num 
      stop=true
      break
    else 
      #if it is dont count it again
      primes[primes.index(num)]=0
    end
  }
  if !stop ; rotated+=nums.length end
}
puts rotated+2 #add 2 and 5 back in