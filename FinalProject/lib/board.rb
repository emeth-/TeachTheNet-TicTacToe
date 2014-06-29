require './lib/pieces.rb'

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
		showBoard
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
				player_turn('white')
			else
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
		puts "OUTPUT!! #{fromTile} #{fromValue} #{toTile}"
		
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
			
		when *rook
			rookCheck(fromTile,fromValue,toTile,player)
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

		#Case 1: Prevent diagonal moves
		if (fromTile[0] != toTile[0])
			if (fromTile.split('')[1] != toTile.split('')[1])
				return false
			end
		end

		#Case 2: Prevent moving if other pieces are in the way
		#It's OK to assume no diagonal moves at this point in the check
		#Case 2a: Horizontal move
		if fromTile[1] != toTile[1]
			midPieces=[]
			#Case 2aa: Horizontal move (right)
			if fromTile[1].to_i < toTile[1].to_i
				(fromTile[1]..toTile[1]).each {|i| midPieces << @board[fromTile[0].concat(i)]}
				if midPieces.length == 2
					if player == 'white'
						if @white_pieces.keys.include?(toTile)
							return false
						else
							return true
						end
					elsif player == 'black'
						if @black_pieces.keys.include?(toTile)
							return false
						else
							return true
						end
					end
				elsif midPieces.length == 3
					if midPieces[1] != '*'
						return false
					else
						if player == 'white'
							if @white_pieces.keys.include?(toTile)
								return false
							else
								return true
							end
						elsif player == 'black'
							if @black_pieces.keys.include?(toTile)
								return false
							else
								return true
							end
						end
					end
				else
					if midPieces[1..-2].each {|i| i != '*'}
						return false
					else
						if player == 'white'
							puts "mid:::: #{midPieces}"
							if @white_pieces.keys.include?(toTile)
								return false
							else
								return true
							end
						elsif player == 'black'
							if @black_pieces.keys.include?(toTile)
								return false
							else
								return true
							end
						end
					end
				end
			end

		#Case 2b: Vertical move
		else
			return true
		end
		return true
	end


		


end




