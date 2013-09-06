target=600851475143
i=2
while target>1
	while target%i==0
		target/=i
	end
	i+=1
end
print i-1