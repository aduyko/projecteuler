#one,two,three,four,five,six,seven,eight,nine,ten,
#eleven,twelve,thirteen,fourteen,fifteen,sixteen,seventeen,eighteen,nineteen,twenty,
#thirty,forty,fifty,sixty,seventy,eighty,ninety
#zero is never said so its 0
counts={
  0=>0,
  1=>3,
  2=>3,
  3=>5,
  4=>4,
  5=>4,
  6=>3,
  7=>5,
  8=>5,
  9=>4,
  10=>3,
  11=>6,
  12=>6,
  13=>8,
  14=>8,
  15=>7,
  16=>7,
  17=>9,
  18=>8,
  19=>8,
  20=>6,
  30=>6,
  40=>5,
  50=>5,
  60=>5,
  70=>7,
  80=>6,
  90=>6
}
sum=0
(1..1000).each{ |i|
  if !counts[i] 
    counts[i]=0
    if i<100
      counts[i]+=counts[i%10]
      temp=i
      temp=(i/10).floor
      if temp!=0 
        counts[i]+=counts[(temp%10)*10]
        temp=(temp/10).floor
      end
    elsif i<1000
      counts[i]+=counts[i%100]
      counts[i]+=counts[(i/100).floor]
      counts[i]+=7 #hundred
      if (i%100)!=0 ; counts[i]+=3 end #and
    else
      counts[i]=11
    end
  end
  sum+=counts[i]
}
puts sum