def isPrime(n)
  if n<=1;    return false end
  if n<4;     return true end
  if n%2==0;    return false end
  if n<9;     return true end
  if n%3==0;    return false end
  r=Math.sqrt(n).floor
  f=5
  while f<=r
    if n%f==0;  return false end
    if n%(f+2)==0; return false end
    f=f+6
  end
  return true
end

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

def isTriangular?(n)
  math = (Math.sqrt(8*n + 1) + 1)/2
  math%1==0
end

def isPentagonal?(n)
  math = (Math.sqrt(24*n + 1) + 1)/6
  math%1==0
end

def isHexagonal?(n)
  isTriangular? n
end

def getTriangular(n)
  n*(n+1)/2
end

def getPentagonal(n)
  n*(3*n-1)/2
end

def getHexagonal(n)
  n*(2*n-1)
end