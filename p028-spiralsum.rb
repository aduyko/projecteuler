target = 1001
n = 1
sum = 1
counter = 2
while(n!=target*target)
  n+=counter
  sum+=n
  if Math.sqrt(n)==counter+1 ; counter+=2 end
end
print sum