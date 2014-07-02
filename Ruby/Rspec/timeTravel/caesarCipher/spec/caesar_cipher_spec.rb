require './caesarCipher.rb'

describe "caesar_cipher"  do
	it 'should handle all lower case input' do
		caesar_cipher("abcdefg", 3).should == "defghij"
	end 
	it 'should handle mixed input' do
		caesar_cipher("abcdefgABCDEFG",4).should == "efghijkEFGHIJK"
	end	
	it 'should handle wrap arounds' do
		caesar_cipher("xyzXYZ", 6).should == "defDEF"
	end
	it 'should handle spaces' do
		caesar_cipher("hello world", 1).should == "ifmmp xpsme"
	end
	it 'should ignore numbers and punctuation' do
		caesar_cipher('abc 123 %$# {}(',1).should == "bcd 123 %$# {}("
	end
end