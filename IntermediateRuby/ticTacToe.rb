class Game
    
   def initialize
      createBoard
      @player1=getPlayer
      @player2 = @player1 == 'X'? 'O':'X'
      showBoard
   end
   def getPlayer
      puts "Welcome to the game!"
      puts ""
      letter = rand() > 0.5 ? 'X' : 'O'
      puts "You are #{letter}!"
      letter  
   end
   
    def createBoard
        @board = {
            'a1' => ' ',
            'a2' => ' ',
            'a3' => ' ',
            'b1' => ' ',
            'b2' => ' ',
            'b3' => ' ',
            'c1' => ' ',
            'c2' => ' ',
            'c3' => ' '
        }
    end
      
    def showBoard
        puts ""
        puts "#{@board['a1']}|#{@board['a2']}|#{@board['a3']}"
        puts "-----"
        puts "#{@board['b1']}|#{@board['b2']}|#{@board['b3']}"
        puts "-----"
        puts "#{@board['c1']}|#{@board['c2']}|#{@board['c3']}"
        puts ""
    end
      
   def play
       num_turns=1
       while num_turns < 10
        num_turns.odd? ? player_turn(@player1) : player_turn(@player2)
        check_victory
        if check_victory
            break
        end
        num_turns+=1
       end   
   end
   
   def player_turn(player)
        puts player == 'X' ? "It's X's turn!" : "It's O's turn!"
        puts ""
        puts "Where would you like to move? (Ex: A1, A2, etc): "
        space=gets.chomp
        unless @board.keys.include?(space)
            puts ""
            puts "Invalid answer. Try again"
            player_turn(player)
        end
        if @board[space] == ' '
            @board[space] = player
        else
            puts ""
            puts "That space is occupied. Choose again!"
            player_turn(player)
        end
        showBoard
   end
   
   def check_victory
       game_over=false
       #short circuit the check if 3 key spaces are blank
    if @board['a1'] != ' ' && @board['b2'] != ' ' && @board['c3'] != ' '
        if (@board['a1'] == @board['a2'] && @board['a1'] == @board['a3'])
            game_over=true
            winner=@board['a1']
        elsif (@board['b1'] == @board['b2'] && @board['b1'] == @board['b3'])
            game_over=true
            winner=@board['b1']
        elsif (@board['c1'] == @board['c2'] && @board['c1'] == @board['c3'])
            game_over=true
            winner=@board['c1']
        elsif (@board['a1'] == @board['b1'] && @board['a1'] == @board['c1'])
            game_over=true
            winner=@board['a1']
        elsif (@board['a2'] == @board['b2'] && @board['a2'] == @board['c2'])
            game_over=true
            winner=@board['a2']
        elsif (@board['a3'] == @board['b3'] && @board['a3'] == @board['c3'])
            game_over=true
            winner=@board['a3']
        elsif (@board['a1'] == @board['b2'] && @board['a1'] == @board['c3'])
            game_over=true
            winner=@board['a1']
        elsif (@board['c1'] == @board['b2'] && @board['c1'] == @board['a3'])
            game_over=true
            winner=@board['c1']
        else
            game_over=false
        end
    end
    
    if game_over
        puts "Game Over! The winner is #{winner}!"
        return true      
    end

   end

end

g=Game.new
g.play

#Sample output below

=begin
Welcome to the game!

You are O!

 | | 
-----
 | | 
-----
 | | 

It's O's turn!

Where would you like to move? (Ex: A1, A2, etc): 
 a1

O| | 
-----
 | | 
-----
 | | 

It's X's turn!

Where would you like to move? (Ex: A1, A2, etc): 
 b1

O| | 
-----
X| | 
-----
 | | 

It's O's turn!

Where would you like to move? (Ex: A1, A2, etc): 
 b2

O| | 
-----
X|O| 
-----
 | | 

It's X's turn!

Where would you like to move? (Ex: A1, A2, etc): 
 c1

O| | 
-----
X|O| 
-----
X| | 

It's O's turn!

Where would you like to move? (Ex: A1, A2, etc): 
 c3

O| | 
-----
X|O| 
-----
X| |O

Game Over! The winner is O!
=end



