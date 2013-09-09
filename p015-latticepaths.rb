dim=20
routes=Array.new(dim+1) { |i| Array.new(dim+1)}
(0..dim).each { |i|
  (0..dim).each { |j|
    if i==0 and j==0 ; routes[i][j]=0 
    elsif i+j==1 ; routes[i][j]=1 
    elsif i==0 
      routes[i][j]=routes[i][j-1]
    elsif j==0
      routes[i][j]=routes[i-1][j]
    else
      routes[i][j]=routes[i-1][j]+routes[i][j-1]
    end
  }
}
print routes[dim][dim]