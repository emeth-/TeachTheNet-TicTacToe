def substrings(string,dictionary)
    output = Hash.new(0)
    string.downcase.split(/[^\w']+/).each do |i|
        dictionary.each do |j|
            output[j] += 1 if i[j]
        end
    end
    p output
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?",dictionary)