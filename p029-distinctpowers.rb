min=2
max=100
powers=[]
(min..max).each { |i|
  (min..max).each { |j|
    powers.push(i**j)
  }
}
print powers.uniq!.length