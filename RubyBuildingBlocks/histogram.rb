puts "Enter your input:"
text=gets.chomp
words=text.split(' ')
frequencies=Hash.new(0)
words.each {|i| frequencies[i]+=1}
frequencies = frequencies.sort_by do |key, value|
    value
end
frequencies.reverse.each do |key, value|
    puts key + ' ' + value.to_s
end