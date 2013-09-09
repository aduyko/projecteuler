@results=Hash.new{0}
@results[1]=1

def getCollatz(num)
	if @results[num]!=0 ; return @results[num] end
	if num%2==0 ; @results[num]=1+getCollatz(num/2) 
	else @results[num]=1+getCollatz(3*num+1) 
	end
	return @results[num]
end

maxChain=0
maxNum=0
(2..1000000).each{ |i|
	if @results[i]==0 ; getCollatz(i) end
	if @results[i]>maxChain ; maxChain=@results[i] ; maxNum=i end
}
print maxNum