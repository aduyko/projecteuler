input = File.new("p042-words.txt")
data = input.gets.split(",").map { |s| s.gsub("\"","")}
input.close
mapped = data.map { |s| s.split("").map { |c| c.ord-64 } .inject(:+) }

tri = []
current = 1
nextnum = 0
until nextnum>mapped.max 
  nextnum = current*(current+1)/2
  tri.push(nextnum)
  current+=1
end

answer = 0
mapped.each { |i|
  if tri.include?(i) ; answer +=1 end
}
puts answer