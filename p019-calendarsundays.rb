def doomsday(year)
  return (2+5*(year%4)+4*(year%100)+6*(year%400))%7
end
#doomsdays by month
ref=[3,14,14,4,9,6,4,8,5,10,7,12]
altref=[4,22]
sum=0
(1901..2000).each{ |y|
  dday=doomsday(y) #day of the week 0-6
  (0..11).each{ |i|
    if (y%4==0 and y%100!=0) or y%400==0 and i<2 #on leap year replace jan and feb dday
      first=(dday+(1-altref[i]))%7
    else
      first=(dday+(1-ref[i]))%7
    end
    if first==0 ; sum+=1 end
  }
}
print sum