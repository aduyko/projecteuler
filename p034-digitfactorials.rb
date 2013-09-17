#precompute factorials for 0-9
factorials = [1,1]
(2..9).each { |i|
  factorials.push(i*factorials[i-1])
}
#recursive function to populate @possible with all possible combinations of the digits 0-9
@possible=[]
def comb(ary,cur,maxdig,max)
  if cur > maxdig ; return 0 end
  if ary.length==max ; @possible.push(ary.join) ; return 0 end
  (cur..9).each { |i|
      comb(ary.push(i),i,maxdig,max)
      ary.pop
  }
end
#build the array of possible digit combinations with a maximum length of 8. 
#99,999,999 factorialized by digit is much smaller than 99,999,999 so its impossible
#for any number to be bigger than that and meet the criteria. 
array=[]
digits = 8
digits.downto(0).each{ |i|
  comb(array,0,9,i)
}
@possible.pop #gets rid of null value which i dont even want to think about right now!!!
answer = 0
#check if the sum of the possible value digits factorials equals the possible value
@possible.each { |i|
  sum = i.to_s.split("").map { |j| factorials[j.to_i] } .inject(:+) #sum of integer factorials
  sorted = i.to_s.split("").map { |j| j.to_i } .sort #sort the numbers of the possible answer
  sortedsum = sum.to_s.split("").map { |j| j.to_i } .sort #sort the digits of the sum of factorials
  if sortedsum==sorted && sum>2 ; answer+=sum end #if they match, the sum = the product of its factorials
}
puts answer