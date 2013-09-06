target=10001
primes=[2]
i=3
until primes.length==target
	prime=true
	for j in primes
		if i%j==0 
			prime=false 
			break
		end
	end
	if prime ; primes.push(i) end
	i=i+2
end
print primes[target-1]