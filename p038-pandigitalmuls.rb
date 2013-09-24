limit=10000
max=0
(1...limit).each{ |i|
  answer=''
  n=1
  until answer.length>=9
    answer+=(i*n).to_s
    n+=1
  end
  if answer.length>9 ; next end
  if answer.split("").sort.join != '123456789' ; next end
  if answer.to_i>max ; max=answer.to_i end
}
puts max