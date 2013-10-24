input = File.read("p067-triangle.txt")
data = []
input.each_line { |line|
  row = line.split(" ").map { |i| i.to_i }
  data.push(row)
}

data.each_index { |i|
  if i==0 ; next end
  data[i].each_index { |j|
    if j==0 
      data[i][j]+=data[i-1][j]
    elsif j==(data[i].length-1) 
      data[i][j]+=data[i-1][j-1]
    else
      data[i][j]+=[data[i-1][j-1],data[i-1][j]].max
    end
  }
}
print data[data.length-1].max