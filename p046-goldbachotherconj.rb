require_relative 'equations'

$squares = []
$last = 20
(1..$last).each { |i|
  $squares.push(2 * (i**2))
}
def equation(n)
  if n>$squares.last
    $last+=1
    $squares.push(2 * ($last**2))
  end
  $squares.each { |i|
    if i>n ; return false end
    if isPrime(n-i) ; return true end
  }
  return false
end
test = 9
while equation(test)
  while isPrime(test+2)
    test+=2
  end
  test+=2
end
puts test