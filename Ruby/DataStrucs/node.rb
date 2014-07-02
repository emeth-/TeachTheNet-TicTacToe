#This file defines the Node class for the binary tree
class Node
attr_accessor :value, :parent, :left, :right

	def initialize (value, parent = nil, left = nil, right = nil)
		@value = value
		@parent = parent
		@left = left
		@right = right
	end
end