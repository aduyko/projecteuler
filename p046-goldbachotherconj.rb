require_relative 'equations'

start = 144
hex = getHexagonal(start)
until isPentagonal? hex 
  start+=1
  hex = getHexagonal(start)
end
puts hex