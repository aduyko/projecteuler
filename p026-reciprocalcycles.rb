target = 1000
num = 0
longest = "1"
(1...target).each { |i|
    divisor = i
    while divisor%2==0 ; divisor/=2 end
    while divisor%5==0 ; divisor/=5 end
    dividend = 9
    quotient = ""
    if dividend%divisor==0
      quotient+=(dividend/divisor).to_s
    end
    if divisor > dividend
       quotient+="0"
    end
    until dividend%divisor==0
        while dividend<divisor
          dividend = dividend*10+9
        end
        quotient+=((dividend/divisor).floor).to_s
        dividend-=((dividend/divisor).floor*divisor)
    end
    if quotient.length >= longest.length ; longest = quotient ; num = i end
}
puts num