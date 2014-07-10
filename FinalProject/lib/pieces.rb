class Pieces
	attr_accessor :piece, :color

	def initialize(color)
		@piece = piece
		@color = color.downcase
	end

	def pawn
		if @color == 'black'
			#Unicode for black rook
			@piece = "\u{265F}"
		elsif @color == 'white'
			#Unicode for white rook
			@piece = "\u{2659}"
		end
	end

	def rook
		if @color == 'black'
			#Unicode for black rook
			@piece = "\u{265C}"

		elsif @color == 'white'
			#Unicode for white rook
			@piece = "\u{2656}"
		end
	end
	
	def knight
		if @color == 'black'
			#Unicode for black rook
			@piece = "\u{265E}"

		elsif @color == 'white'
			#Unicode for white rook
			@piece = "\u{2658}"
		end		
	end

	def bishop
		if @color == 'black'
			#Unicode for black rook
			@piece = "\u{265D}"

		elsif @color == 'white'
			#Unicode for white rook
			@piece = "\u{2657}"
		end		
	end

	def king
		if @color == 'black'
			#Unicode for black rook
			@piece = "\u{265A}"

		elsif @color == 'white'
			#Unicode for white rook
			@piece = "\u{2654}"
		end		
	end

	def queen
		if @color == 'black'
			#Unicode for black rook
			@piece = "\u{265B}"

		elsif @color == 'white'
			#Unicode for white rook
			@piece = "\u{2655}"
		end		
	end



end