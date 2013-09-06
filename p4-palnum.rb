palindrome=0
999.downto(100) { |i|
	i.downto(100) { |j|
		result=(i*j).to_s
		if result==result.reverse && Integer(palindrome)<Integer(result) ; palindrome = result	end
	}
}
print palindrome