divisors=1
trinum=6 #start with first even because even #s always have more divisors
i=4 #number about to be added
skip=false
until divisors>500
	factors=[]
	if skip
  	trinum=trinum+(i*3)+3
  	i=i+3
  	skip=false
  else
  	trinum+=i
  	i=i+1
  	skip=true 
  end 
  divisors=1
  testnum=trinum
	(2..Math.sqrt(testnum)).each{|j|
		nextdivisor=1
		while testnum%j==0 ; testnum/=j and nextdivisor+=1 end
		divisors*=nextdivisor
	}
end
print trinum