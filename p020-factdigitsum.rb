print (1..100).to_a.inject(:*).to_s.split("").map{ |i| i.to_i }.inject(:+)