first=1
second=1
evensum=0
until second>4000000
	if second%2==0 ; evensum+=second end
	first,second=second,first+second
end
print evensum