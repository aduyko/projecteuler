a = 1
b = 1
term = 1
target = 1000
until a.to_s.length==target
  a,b=b,a+b
  term+=1
end
print term