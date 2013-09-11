input = File.new("p022-names.txt")
data = input.gets.split(",").map { |s| s.gsub("\"","")} .sort
sum = 0
data.each_with_index { |s,i| 
  sum += s.split("").map { |c| c.ord-64 } .inject(:+)*(i+1)
}
print sum
input.close