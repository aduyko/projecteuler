data=(0..9).to_a
@target=1000000
@count=0
def permute(arr,start,n)
  @count+=1
  if @count==@target
    print arr.join
  elsif start<n and @count<@target
    (n-2).downto(start) { |i|
      (i+1...n).each { |j|
        arr[i],arr[j]=arr[j],arr[i]
        permute(arr,i+1,n)
      }
      arr[i..n]=arr[i..n].rotate
    }
  end
end
permute(data,0,data.length)