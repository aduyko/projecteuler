sum_squares = 0
square_sums = 0
target=100
for i in 1..target
	sum_squares+=i**2
	square_sums+=i
end
square_sums**=2
print square_sums-sum_squares