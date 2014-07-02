require 'enumerable_methods.rb'

describe "#my_each" do 
	it 'should output every item it receives'
		([1,2,3,4,5].my_each {|i| puts i}).should == "1\n2\n3\n4\n5"
	end
end