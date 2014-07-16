def fibs(n)
	n=n.to_i
	i=0
	j=1
	while i<=n-1
		yield i
	i,j = j,i+j
	end
end

def fibs_rec(n)
	n=n.to_i
	return n if n<=1
	return fibs_rec(n-1) + fibs_rec(n-2)
end

puts "Please enter a number: "
num=gets.chomp.to_i
puts "\nFibonnacci (Iteratively): "
puts "#{fibs(num) {|i| puts i}}"
puts "\nFibonnacci (Recursively): "
puts "#{fibs_rec(num-1)}"