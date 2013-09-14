@coins=[1,2,5,10,20,50,100,200].reverse
@combinations=[]
def count(num,idx)
  if num==0 ; return 1 end
  if idx==1 ; return 1 end
  sum=0
  @coins.each { |i|
    if i<=idx && i<=num ; sum+=count(num-i,i) end 
  }
  return sum
end
target=200
print count(target,@coins[0])