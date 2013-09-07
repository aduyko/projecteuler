target=1000
a=0
b=0
(1..target).each{ |i|
	(i..target).each{ |j|
		if i+j+Math.sqrt(i**2+j**2)==target
			a=i
			b=j
			break
		end
	}
	if a!=0 ; break end
}
print a*b*Math.sqrt(a**2+b**2)