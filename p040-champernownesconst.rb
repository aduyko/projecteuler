def getDigit(n)
  if n<10 ; return n end
  i=9 #how many 1 digit numbers there are
  length=9 #the length of the string so far
  newlength=9
  until n<=newlength
    i*=10 #how many i.length digit numbers there are
    length=newlength 
    newlength+=i*i.to_s.length #length of the string after adding every i.length digit number
  end
  #i.to_s.length is hte length of the firsrt number added
  #i is how many of that number there are
  n-=(length+1) #n is how many more characters we need
  diglen = i.to_s.length #length of characters being added
  start = 10**(diglen-1) #first number added
  r = n-(n/diglen)*diglen #is weird because of floors. returns index of digit to return
  start+=n/diglen #get number we need
  a = start.to_s.split("") #number we need
  return a[r].to_i
end
puts (0..5).to_a.map { |i| getDigit(10**i) } .inject(:*)