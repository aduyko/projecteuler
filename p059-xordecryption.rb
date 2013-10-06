def isChar?(c)
  c>31 && c<123 && (c<91 || c>96)
end

input = File.open('p059-cipher.txt')
cipher = input.gets.split(",").map { |i| i.to_i }
input.close
key = [97,97,97]
count = 0
26.times{
  26.times{
    26.times{
      valid = true
      answer = ''
      cipher.each_index { |i|
        cipher[i] ^= key[i%3]
        answer << cipher[i].chr
        unless isChar? cipher[i]; valid = false end
        cipher[i] ^= key[i%3]
        unless valid ; break end
      }
      if valid 
        puts answer
        sum = 0
        answer.split("").each { |c|
          sum+=c.ord
        }
        puts sum 
      end
      key[2]+=1
    }
    key[1]+=1
    key[2]=97
  }
  key[0]+=1
  key[1,2]=[97,97]
}