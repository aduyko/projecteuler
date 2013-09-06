divisors = []
target = 20
for i in 1..target
	for j in divisors
		if i%j==0 ; i/=j end
	end
	if i!=1 ; divisors.push(i) end
end
sum = 1
for i in divisors
	sum*=i
end
print sum