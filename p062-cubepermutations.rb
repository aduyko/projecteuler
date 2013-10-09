digits = Hash.new(0)
first = Hash.new(0)
answer = 0
i = 1
while answer==0
  sorted = (i**3).to_s.split("").sort.join
  digits[sorted] += 1
  if first[sorted]==0 ; first[sorted] = i**3 end
  if digits[sorted]==5
    answer = i
    puts first[sorted]
  end
  i += 1
end