def isPrime(n)
	if n==1; 		return false end
	if n<4; 		return true end
	if n%2==0; 		return false end
	if n<9; 		return true end
	if n%3==0; 		return false end
	r=Math.sqrt(n).floor
	f=5
	while f<=r
		if n%f==0;	return false end
		if n%(f+2)==0; return false end
		f=f+6
	end
	return true
end

target=2000000
sum=0
i=1
(1..target).each{ |i|
	if isPrime(i) ; sum+=i end
}
print sum