start, pow = 1,1
answer = 0

begin
  numcounted = false
  s = start
  until (s**pow).to_s.length>pow
    if (s**pow).to_s.length==pow ; answer += 1 ; numcounted = true end
    s += 1
  end
  pow += 1
end while numcounted

puts answer