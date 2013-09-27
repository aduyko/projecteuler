found = false
n = 1
target = 6
until found==true
  if (n*target).to_s.length > n.to_s.length ; n+=1 ; next end
  digits = n.to_s.split("").sort
  (2..target).each { |i|
    if digits!=(n*i).to_s.split("").sort ; n+=1 ; break end
    if i==target ; found = true end
  }
end
print n