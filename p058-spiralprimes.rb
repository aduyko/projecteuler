require_relative 'equations'

n = 9
counter = 0
addnum = 3
prime = 3.0
total = 5.0
until prime/total<0.1
  case counter
  when 0
    n += 1
    counter += 1
  when 1
    n += addnum
    addnum += 1
    counter += 1
  when 2
    n += addnum
    counter += 1
  when 3
    n += addnum
    counter += 1
  when 4
    n += addnum
    addnum += 1
    counter = 0
  end
  if isPrime(n) && counter!=1 ; prime += 1.0 end
  if counter != 1 ; total += 1.0 end
end
print addnum