class Checks
	attr_accessor :fromTile, :fromValue, :toTile, :player

def initialize(fromTile,fromValue,toTile,player)
	@fromTile=fromTile
	@fromValue=fromValue
	@toTile=toTile
	@player=player

end

def pawnCheck(fromTile,fromValue,toTile,player)
	#case: tries to move pawn more than 1 tile (vertically) at a time
		if (@toTile.split('')[0].ord - @fromTile.split('')[0].ord).abs != 1
			return false
		#case tries to move diagonally with no opponent piece there
		#note: don't need to re check item 1 again here.
		elsif (@toTile.split('')[1].to_i - @fromTile.split('')[1].to_i).abs == 1
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
				if @toTile.split('')[0].ord - @fromTile.split('')[0].ord != -1
					return false
				else 
					return true unless @board[toTile] != '*'
				end
			elsif player == 'black'
				if @toTile.split('')[0].ord - @fromTile.split('')[0].ord != 1
					return false
				else
					return true unless @board[toTile] != '*'
				end
			end
		return false
		end
	end
		


end