require './lib/pieces.rb'

##TODO: FIX DIAGONAL_PATH_CLEAR?
##TODO: REMOVE CAPTURED PIECES

#### Note: The board will look like this:
# 	1 2 3 4 5 6 7 8 
# a * * * * * * * *     <~ Black pieces on top
# b * * * * * * * *
# c * * * * * * * *
# d * * * * * * * *
# e * * * * * * * *
# f * * * * * * * *
# g * * * * * * * *
# h * * * * * * * *     <~ White pieces on bottom
#

class Board
	attr_reader :black_pieces, :white_pieces, :board
	def initialize
		getPieces
		drawBoard
		intro
		playGame
	end

	def getPieces

		@black_pieces = {
			'a1' => Pieces.new('black').rook,
			'a2' => Pieces.new('black').knight,
			'a3' => Pieces.new('black').bishop,
			'a4' => Pieces.new('black').queen,
			'a5' => Pieces.new('black').king,
			'a6' => Pieces.new('black').bishop,
			'a7' => Pieces.new('black').knight,
			'a8' => Pieces.new('black').rook,
			'b1' => Pieces.new('black').pawn,
			'b2' => Pieces.new('black').pawn,
			'b3' => Pieces.new('black').pawn,
			'b4' => Pieces.new('black').pawn,
			'b5' => Pieces.new('black').pawn,
			'b6' => Pieces.new('black').pawn,
			'b7' => Pieces.new('black').pawn,
			'b8' => Pieces.new('black').pawn
		}

		@white_pieces = {
			'h1' => Pieces.new('white').rook,
			'h2' => Pieces.new('white').knight,
			'h3' => Pieces.new('white').bishop,
			'h4' => Pieces.new('white').queen,
			'h5' => Pieces.new('white').king,
			'h6' => Pieces.new('white').bishop,
			'h7' => Pieces.new('white').knight,
			'h8' => Pieces.new('white').rook,
			'g1' => Pieces.new('white').pawn,
			'g2' => Pieces.new('white').pawn,
			'g3' => Pieces.new('white').pawn,
			'g4' => Pieces.new('white').pawn,
			'g5' => Pieces.new('white').pawn,
			'g6' => Pieces.new('white').pawn,
			'g7' => Pieces.new('white').pawn,
			'g8' => Pieces.new('white').pawn
		}

	end

	def drawBoard
		@board = Hash.new	
		#Initialize an empty board
		('a'..'h').each do |letter|
			(1..8).each do |i|
				@board["#{letter}#{i}"] = "*"
			end
		end

		#Add pieces to the board
			@white_pieces.each do |key,value|
				@board["#{key}"] = "#{value}"
			end
			@black_pieces.each do |key,value|
				@board["#{key}"] = "#{value}"
			end
	end

	def showBoard
		puts "  1 2 3 4 5 6 7 8"
		('a'..'h').each do |letter|
				print "#{letter.upcase} "
			(1..8).each do |i|
				print "#{@board["#{letter}#{i}"]} "
			end
			puts
		end
		puts
	end


	def intro
		puts "Welcome to command line Chess, written in Ruby!"
		puts "\nPlayer 1 plays as White and Player 2 plays as Black"
		puts "\nPlayer 1 moves first. Good luck!\n\n"
	end

	def playGame
		turn_count = 1
		while true
			if turn_count % 2 != 0
				if check?('white')
					checkmate?('white')
				end
				player_turn('white')
					

			else
				if check?('black')
					checkmate?('black')
				end
				player_turn('black')
				
			end

			break if check_victory
			turn_count+=1
		end
	end

	def player_turn(color)
		showBoard
		puts "\nIt's #{color}'s turn. "
		puts "\nMove from: "
		from = gets.chomp
		puts "\nMove to: "
		to = gets.chomp
				make_move(color,from,to)
	end

	def off_board?(from,to)
		#Check from values
		validLets=['a','b','c','d','e','f','g','h']
		validNums=[1,2,3,4,5,6,7,8]
		return false if !(validLets.include?(from[0]) || validLets.include?(to[0]))
		return false if !(validNums.include?(from[1]) || validNums.include?(to[1]))
		return true
	end
	def make_move(color,from,to)
		check_valid(color,from,to)

	end

	def check_valid(color,from,to)
		if color == 'black'
			#if there is actually a black piece on the "from" tile
			if @black_pieces.keys.include?(from)
				#Check if the selected piece is legally allowed to move to the "to" tile
				if legal_move?(from,@black_pieces[from],to,'black')
					@board[to] = @board[from]
					@board[from] = '*'
					#update the black_pieces hash to include the new space
					@black_pieces[to] = @black_pieces[from]
					@black_pieces.delete(from)
				else
					puts "\nInvalid move. Try again.\n"
					player_turn(color)
				end
			else
				puts "\nInvalid move. Try again.\n"
				player_turn(color)
			end
		else
			#check if white piece on from tile
			if @white_pieces.keys.include?(from)				
				#Check if the selected piece is legally allowed to move to the "to" tile
				if legal_move?(from,@white_pieces[from],to,'white')
					@board[to] = @board[from]
					@board[from] = '*'
					#update the white_pieces hash to include the new space
					@white_pieces[to] = @white_pieces[from]
					@white_pieces.delete(from)
				else
					puts "\nInvalid move. Try again.\n"
					player_turn(color)
				end
			else
				puts "\nInvalid move. Try again.\n"
				player_turn(color)
			end
		end
	end

	def check_victory
	end

	def legal_move?(fromTile,fromValue,toTile,player)
		#this method checks whether any given piece located at "from" 
		#can legally move to the #to space
	#	puts "OUTPUT!! #{fromTile} #{fromValue} #{toTile}"
		
		#Compute valid moves for every type of piece
		pawn=["\u{265F}","\u{2659}"]
		rook=["\u{265C}","\u{2656}"]
		knight=["\u{265E}","\u{2658}"]
		bishop=["\u{265D}","\u{2657}"]
		king=["\u{265A}","\u{2654}"]
		queen=["\u{265B}","\u{2655}"]

		case fromValue

			#pawns can move one tile vertically, or one tile diagonally when attacking
		when *pawn
			pawnCheck(fromTile,fromValue,toTile,player)	
			#rooks can move horizontally or vertically	
		when *rook
			rookCheck(fromTile,fromValue,toTile,player)
			#bishops can move diagonally
		when *bishop
			bishopCheck(fromTile,fromValue,toTile,player)
			#knights can move in an L pattern, and can jump other pieces
		when *knight
			knightCheck(fromTile,fromValue,toTile,player)
		when *queen
			queenCheck(fromTile,fromValue,toTile,player)
		when *king
			kingCheck(fromTile,fromValue,toTile,player)
		end
	end
			

	#This method verifies that a pawn move is valid.
	def pawnCheck(fromTile,fromValue,toTile,player)
	#case: tries to move pawn more than 1 tile (vertically) at a time
		if (toTile[0].ord - fromTile[0].ord).abs != 1
			return false
		#case tries to move diagonally with no opponent piece there
		#note: don't need to re check item 1 again here.
		elsif (toTile[1].to_i - fromTile[1].to_i).abs == 1
			if player == 'white'
				if @black_pieces.keys.include?(toTile)
					return true
				else
					return false
				end
			elsif player == 'black'
				if @white_pieces.keys.include?(toTile)	
					return true
				else
					return false
				end	
			end
		else
		#prevent a one-space backwards move for pawns
			if player == 'white'
				if toTile[0].ord - fromTile[0].ord != -1
					return false
				else 
					return true unless @board[toTile] != '*'
				end
			elsif player == 'black'
				if toTile[0].ord - fromTile[0].ord != 1
					return false
				else
					return true unless @board[toTile] != '*'
				end
			end
		return false
		end
	end

	#This method checks that a rook move is valid

	def rookCheck(fromTile,fromValue,toTile,player)
		#fromTile is something like "a1" and toTile is something like "e3". fromValue is the piece
		#Case 0: Check that the player isn't moving to where his current piece is
		if player == 'white'		
			return false if @white_pieces.keys.include?(toTile)
		elsif player == 'black'
			return false if @black_pieces.keys.include?(toTile)
		end

		#Case 1: Prevent diagonal moves
		if (fromTile[0] != toTile[0])
			if (fromTile.split('')[1] != toTile.split('')[1])
				return false
			end
		end

		#Case 2: Prevent moving if other pieces are in the way
		if pathClear?(fromTile,toTile)
			return true
		else
			return false
		end
	end

	def bishopCheck(fromTile,fromValue,toTile,player)
		#fromTile/toTile are formatted like "b3", "a3", etc
		#Case 0: Check that the player isn't moving to where his current piece is
		if player == 'white'		
			return false if @white_pieces.keys.include?(toTile)
		elsif player == 'black'
			return false if @black_pieces.keys.include?(toTile)
		end
		#Case 1: Check whether the player is moving in a valid diagonal line
		return false unless validDiag(fromTile,toTile)
		if pathClear?(fromTile,toTile)
			return true
		else
			return false
		end
	end

	def kingCheck(fromTile,fromValue,toTile,player)
		#Case 0: Check that the player isn't moving to where his current piece is
		if player == 'white'		
			return false if @white_pieces.keys.include?(toTile)
		elsif player == 'black'
			return false if @black_pieces.keys.include?(toTile)
		end
		#Case 1: Kings can move exactly one tile in any direction, unless that puts them into check
		if ((fromTile[0].ord - toTile[0].ord).abs > 1 )|| ((fromTile[1].to_i - toTile[1].to_i).abs > 1)
			return false
		else
			if in_check?(player,toTile)
				"Puts cannot move there. That would be check!"
				return false
			else
				return true
			end
		end
	end
	def check?(color)
		if color == 'white'
			whiteKing=''
			@white_pieces.each do |k,v|
				whiteKing = k if v == "\u{2654}"
			end
			@black_pieces.each do |k,v|
				if legal_move?(k,v,whiteKing,'black')
					puts "White is in check!"
				end
			end

		elsif color == 'black'
			blackKing=''
			@black_pieces.each do |k,v|
				blackKing = k if v == "\u{265A}"
			end
			@white_pieces.each do |k,v|
				if legal_move?(k,v,blackKing,'white')
					puts "Black is in check!"
				end
			end
		end
	end


	def checkmate?(color)

	end

	def in_check?(color,toTile)
		if color == 'white'
			if @black_pieces.keys.any? {|i| legal_move?(i,@black_pieces[i],toTile,'black')}
				puts "White is in check!"
				return true
			else
				return false
			end
		elsif color == 'black'
			if @white_pieces.keys.any? {|i| legal_move?(i,@white_pieces[i],toTile,'white')}
				puts "Black is in check!"
				return true
			else
				return false
			end
		end
	end



	def queenCheck(fromTile,fromValue,toTile,player)
		from=fromTile
		to=toTile
		#Case 0: Check that the player isn't moving to where his current piece is
		if player == 'white'		
			return false if @white_pieces.keys.include?(toTile)
		elsif player == 'black'
			return false if @black_pieces.keys.include?(toTile)
		end
		#Case1: Check whether the player is making a valid move
		#1a: Add valid diagonal moves for queen
		i=1 
		valid=[]
		while i < 8
			#rows above from value. The unless statements take care of off-the-board moves
			valid << "#{(from[0].ord-i).chr}#{from[1].to_i-i}" unless (from[0].ord-i < 'a'.ord || from[1].to_i-i < 1)
			valid << "#{(from[0].ord-i).chr}#{from[1].to_i+i}" unless (from[0].ord-i < 'a'.ord || from[1].to_i+i > 8)

			#rows below from value
			valid << "#{(from[0].ord+i).chr}#{from[1].to_i-i}" unless (from[0].ord+i > 'h'.ord || from[1].to_i-i < 1)
			valid << "#{(from[0].ord+i).chr}#{from[1].to_i+i}" unless (from[0].ord+i > 'h'.ord || from[1].to_i+i > 8)
			i+=1
		end
		#1b: Add valid vertical and horizontal moves for queen
		valid2=[]
		j=1
		while j<8
			#Horizontal:
			valid2 << "#{from[0]}#{from[1].to_i-j}" unless (from[1].to_i-j < 1)
			valid2 << "#{from[0]}#{from[1].to_i+j}" unless (from[1].to_i+j > 8)
			#Vertical:
			valid2 << "#{((from[0].ord)-j).chr}#{from[1]}" unless ((from[0].ord-j).chr < 'a')
			valid2 << "#{((from[0].ord)+j).chr}#{from[1]}" unless ((from[0].ord+j).chr > 'h')
			j+=1
		end
		valid2.each {|i| valid << i}
		return false unless valid.include?(toTile)
		if pathClear?(fromTile,toTile)
			return true
		else
			return false
		end
	end


	def knightCheck(fromTile,fromValue,toTile,player)
		from=fromTile
		#Case 0: Check that the player isn't moving to where his current piece is
		if player == 'white'		
			return false if @white_pieces.keys.include?(toTile)
		elsif player == 'black'
			return false if @black_pieces.keys.include?(toTile)
		end
		#Case1: Check that the player is moving to a valid position for a knight
		valid=[]
		valid << "#{(from[0].ord-2).chr}#{from[1].to_i-1}" unless (from[0].ord-2 < 'a'.ord || from[1].to_i-1 < 1)
		valid << "#{(from[0].ord-2).chr}#{from[1].to_i+1}" unless (from[0].ord-2 < 'a'.ord || from[1].to_i+1 > 8)
		valid << "#{(from[0].ord-1).chr}#{from[1].to_i-2}" unless (from[0].ord-1 < 'a'.ord || from[1].to_i-2 < 1)
		valid << "#{(from[0].ord-1).chr}#{from[1].to_i+2}" unless (from[0].ord-1 < 'a'.ord || from[1].to_i+2 > 8)
		valid << "#{(from[0].ord+1).chr}#{from[1].to_i-2}" unless (from[0].ord+1 > 'h'.ord || from[1].to_i-2 < 1)
		valid << "#{(from[0].ord+1).chr}#{from[1].to_i+2}" unless (from[0].ord+1 > 'h'.ord || from[1].to_i+2 > 8)
		valid << "#{(from[0].ord+2).chr}#{from[1].to_i-1}" unless (from[0].ord+2 > 'h'.ord || from[1].to_i-1 < 1)
		valid << "#{(from[0].ord+2).chr}#{from[1].to_i+1}" unless (from[0].ord+2 > 'h'.ord || from[1].to_i+1 > 8)
		#puts "Valid moves: #{valid}"

		if valid.include?(toTile)
			return true
		else
			return false
		end
	end

	def pathClear?(from,to)
		#'from/to' values are of the form 'a1'
		midPieces=[]
		#horizontal movement
		if from[0] == to[0] && from[1] != to[1]
			((min(from[1].to_i,to[1].to_i))..(max(from[1].to_i,to[1].to_i))).each {|i| midPieces << @board["#{from[0]}#{i}"] }
			if midPieces.length > 2
				#This checks that there are no pieces in the way
				if midPieces[1..-2].all? {|i| i == '*'}
				#	puts "true horz midd::: #{midPieces}"
					return true
				else
				#	puts "false horz midd::: #{midPieces}"
					return false
				end
			else
				return true
			end
		#vertical movement
		elsif from[1] == to[1] && from[0] != to[0]
			((min(from[0].ord,to[0].ord))..(max(from[0].ord,to[0].ord))).each {|i| midPieces << @board["#{i.chr}#{from[1]}"] }
			if midPieces.length > 2
				#This checks that there are no pieces in the way
				if midPieces[1..-2].all? {|i| i == '*'}
				#	puts "true vert midd::: #{midPieces}"
					return true
				else
				#	puts "false vert midd::: #{midPieces}"
					return false
				end
			else
				return true
			end
		#Diagonal movement
		else
			
			spacesApart = (from[1].to_i - to[1].to_i).abs	
			
			case
			#if diagonal toward top-right
			when from[0].ord > to[0].ord && (from[1].to_i < to[1].to_i)
				i=1
				while i<=spacesApart
					midPieces << @board["#{(from[0].ord-i).chr}#{(from[1].to_i+i)}"]
					i+=1
				end
				if midPieces.length > 2
					#This checks that there are no pieces in the way
					if midPieces[1..-2].all? {|i| i == '*'}
						return true
					else
						return false
					end
				else
					return true
				end
			#if diagonal toward top-left
			when from[0].ord > to[0].ord && (from[1].to_i > to[1].to_i)
				i=1
				while i<=spacesApart
					midPieces << @board["#{(from[0].ord-i).chr}#{(from[1].to_i-i)}"]
					i+=1
				end
				if midPieces.length > 2
					#This checks that there are no pieces in the way
					if midPieces[1..-2].all? {|i| i == '*'}
						return true
					else
						return false
					end
				else
					return true
				end
			#if diagonal toward bottom-left
			when from[0].ord < to[0].ord && (from[1].to_i > to[1].to_i)
				i=1
				while i<=spacesApart
					midPieces << @board["#{(from[0].ord+i).chr}#{(from[1].to_i-i)}"]
					i+=1
				end
				if midPieces.length > 2
					#This checks that there are no pieces in the way
					if midPieces[1..-2].all? {|i| i == '*'}
						return true
					else
						return false
					end
				else
					return true
				end
			#if diagonal toward bottom-right
			when from[0].ord < to[0].ord && (from[1].to_i < to[1].to_i)
				i=1
				while i<=spacesApart
					midPieces << @board["#{(from[0].ord+i).chr}#{(from[1].to_i+i)}"]
					i+=1
				end
				if midPieces.length > 2
					#This checks that there are no pieces in the way
					if midPieces[1..-2].all? {|i| i == '*'}
						return true
					else
						return false
					end
				else
					return true
				end
			end
		end
	end



	def validDiag(from,to) 

		#This method checks that an attempted diagonal move is actually legal (i.e. if it stays in the same diagonal line)
		i=1 
		@valid=[]
		while i < 8
			#rows above from value. The unless statements take care of off-the-board moves
			@valid << "#{(from[0].ord-i).chr}#{from[1].to_i-i}" unless (from[0].ord-i < 'a'.ord || from[1].to_i-i < 1)
			@valid << "#{(from[0].ord-i).chr}#{from[1].to_i+i}" unless (from[0].ord-i < 'a'.ord || from[1].to_i+i > 8)

			#rows below from value
			@valid << "#{(from[0].ord+i).chr}#{from[1].to_i-i}" unless (from[0].ord+i > 'h'.ord || from[1].to_i-i < 1)
			@valid << "#{(from[0].ord+i).chr}#{from[1].to_i+i}" unless (from[0].ord+i > 'h'.ord || from[1].to_i+i > 8)
			i+=1
		end
		if @valid.include?(to)
			return true
		else
			return false
		end

	end


	def min(a, b)
		return b unless a < b
		return a
	end


	def max(a, b)
		return b unless a > b
		return a
	end

		


end




