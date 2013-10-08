require_relative 'equations'

primes = genPrimes(10000)
target = 5
primes.each { |a|
  options=[]
  primes.each { |b|
    if isPrime((a.to_s<<b.to_s).to_i) &&
       isPrime((b.to_s<<a.to_s).to_i) &&
       b!=a &&
       b>a
      options.push(b)
    end
  }
  if options.length<target-1 ; next end
  options.each { |b|
    newoptions = options.clone
    newoptions.delete_if { |c| 
      !isPrime((b.to_s<<c.to_s).to_i) ||
      !isPrime((c.to_s<<b.to_s).to_i) ||
      b==c ||
      c<b
    }
    if newoptions.length<target-2 ; next end
    newoptions.each { |c|
      c_options = newoptions.clone
      c_options.delete_if { |d|
        !isPrime((c.to_s<<d.to_s).to_i) ||
        !isPrime((d.to_s<<c.to_s).to_i) ||
        d==c ||
        d<c
      }
      if c_options.length<target-3 ; next end
      c_options.each { |d|
        d_options = c_options.clone
        d_options.delete_if { |e|
          !isPrime((d.to_s<<e.to_s).to_i) ||
          !isPrime((e.to_s<<d.to_s).to_i) ||
          e==d ||
          e<d
        }
        if d_options.length<target-4 ; next end
        puts a+b+c+d+d_options[0]
      }
    }
  }
}