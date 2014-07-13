require 'csv'

class Hangman
	@save_id=0
	attr_reader :value, :guessed
	def initialize(value=nil,turns=1,guessed=[],dashes=[])
		
		@value = value
		@turns=turns
		@guessed = guessed
		@dashes = dashes
		getWord(@value)
		intro
		playGame
	end


	def getWord(value)
		@value = value
		if @value.nil?
			dictionary = '5desk.txt'
			@value = File.new(dictionary,'r').readlines[rand]
			File.open(dictionary,"r+") do |file|
				#get length of dictionary dynamically
				word_count = file.readlines.size
				#generate a random number between 0 and word_count (to choose random word)		
				word=rand(word_count).ceil
				file.rewind
				file.readlines.each_with_index do |value, index|
					if index == word 
					#	if value.to_s.length > 5 && value.to_s.length < 13
					#		@value = value.downcase.chomp
					#	else
					#		#todo: update this so it won't pick words that are out of range
					#		@value = value.downcase.chomp
					#	end
						unless value.to_s.length > 5 && value.to_s.length < 13
							getWord
						else
							@value = value.downcase.chomp
							@value.length.times {|i| @dashes << " _ "}
						end
					end
				end
			end
		else
			if @dashes.nil?
			@value.length.times {|i| @dashes << " _ "}
			end
		end
		
	end
	def intro
		puts "\nWelcome to Hangman!"
		puts "\nYou have 10 turns to guess the correct word. Good luck!"
		puts "Enter \"SAVE\" at any time to save your game."
	end

	def playGame
		while @turns < 11
			puts "\n***** Number of turns remaining: #{11-@turns} *****"
			puts
			puts @dashes.join

			puts "Guess a letter!"
			guess = gets.downcase.chomp
			if guess == ''
				puts "Invalid guess. Guess again."
				playGame
			elsif guess == "save"
				save_game
				exit
			end
			checkGuessed(guess)
			checkWord(guess)
			if checkVictory
				exit
			end
			
		end	
		puts "Game over! You lose! The word was: #{@value}"
	end	

	def checkGuessed(letter)
		if @guessed.include?(letter)
			puts "You've already guessed \"#{letter}\"! Guess again!"
			playGame
		else
			@guessed << letter
		end
	end

	def checkWord(letter)
		@value.split('').each_with_index do |char,index|
			if char == letter
				@dashes[index] = char
			end
		end
		if @value.include?(letter)
			puts 
			puts "Good guess! #{letter} is in the word!"
			puts 
		else
			puts
			puts "Nope, #{letter} is not in the word."
			puts 
			@turns+=1
		end
	end
	def checkVictory
		if @dashes.join('').gsub(/\s+/,'').downcase.chomp == @value.downcase.chomp
			puts "You win! The word was #{@value}!"
			return true
		else
			return false
		end
	end

	def save_game
		Dir.mkdir('saves') unless Dir.exist? 'saves'
		puts "Please name your game!"
		name=gets.chomp
		file=File.open('saves/saved_games.csv', 'ab')
		file.write("#{name},#{11-@turns},#{@guessed.join},#{@dashes.join.gsub(/\s+/,'')},#{@value}\n")
		file.close
	end



end


def start
	puts "\nPlease enter 'Load' to load a saved game, or 'New' to start a new game!"
	answer=gets.chomp.downcase
	if answer == 'new'
		Hangman.new()
	elsif answer == 'load'
		load_game
	else
		puts "\n Invalid entry."
		start
	end
end

def load_game
    if !(File.exist?("saves/saved_games.csv"))
      puts "There are no saved games.\n Beginning a new game."
      Hangman.new()
    end

    puts "\nSaved Games:\n"
    saves=CSV.open 'saves/saved_games.csv'
    saves.each do |row|
    	puts "Name: #{row[0]}, Turns left: #{row[1]}, Letters guessed: #{row[2]}, Current Game: #{row[3]}"
    end
    puts "\nPlease choose a game to continue"
    choice=gets.chomp
    saves.rewind
    saves.each do |row|
    	if choice == row[0]
    		Hangman.new(row[4],10-row[1].to_i,row[2].split(''),row[3].split(''))
    	else
    		puts "choice: #{choice}"
    	end
    end


end

start

=begin
*****Sample Output****

$ ruby hangman.rb 

Please enter 'Load' to load a saved game, or 'New' to start a new game!
new

Welcome to Hangman!

You have 10 turns to guess the correct word. Good luck!
Enter "SAVE" at any time to save your game.

***** Number of turns remaining: 10 *****

 _  _  _  _  _  _  _  _ 
Guess a letter!
a
Nope, a is not in the word.

***** Number of turns remaining: 9 *****
 _  _  _  _  _  _  _  _ 
Guess a letter!
e
Good guess! e is in the word!

***** Number of turns remaining: 9 *****

 _ e _ e _  _  _  _ 
Guess a letter!
i
Good guess! i is in the word!

***** Number of turns remaining: 9 *****

 _ e _ e _ i _  _ 
Guess a letter!
save
Please name your game!
game4

$ ruby hangman.rb 

Please enter 'Load' to load a saved game, or 'New' to start a new game!
load

Saved Games:
Name: game1, Turns left: 7, Letters guessed: eioa, Current Game: __a____a_
Name: game2, Turns left: 4, Letters guessed: btrsopl, Current Game: _____ll_
Name: game3, Turns left: 3, Letters guessed: eioasgwmnopq, Current Game: s_a___wag
Name: game4, Turns left: 9, Letters guessed: aei, Current Game: _e_e_i__

Please choose a game to continue
game1

Welcome to Hangman!

You have 10 turns to guess the correct word. Good luck!
Enter "SAVE" at any time to save your game.

***** Number of turns remaining: 8 *****

__a____a_
Guess a letter!
e
You've already guessed "e"! Guess again!

***** Number of turns remaining: 8 *****

__a____a_
Guess a letter!
i
You've already guessed "i"! Guess again!

***** Number of turns remaining: 8 *****

__a____a_
Guess a letter!
s
Good guess! s is in the word!


***** Number of turns remaining: 8 *****

s_a____a_
Guess a letter!
c
Good guess! c is in the word!


***** Number of turns remaining: 8 *****

sca____a_
Guess a letter!
l
Good guess! l is in the word!


***** Number of turns remaining: 8 *****

scall__a_
Guess a letter!
y
Good guess! y is in the word!


***** Number of turns remaining: 8 *****

scally_a_
Guess a letter!
w
Good guess! w is in the word!


***** Number of turns remaining: 8 *****

scallywa_
Guess a letter!
g
Good guess! g is in the word!

You win! The word was scallywag!


**** Alternate Output (loss) ****

$ ruby hangman.rb 

Please enter 'Load' to load a saved game, or 'New' to start a new game!
new

Welcome to Hangman!

You have 10 turns to guess the correct word. Good luck!
Enter "SAVE" at any time to save your game.

***** Number of turns remaining: 10 *****

 _  _  _  _  _  _ 
Guess a letter!
e
Good guess! e is in the word!


***** Number of turns remaining: 10 *****

 _ e _  _  _  _ 
Guess a letter!
a
Nope, a is not in the word.


***** Number of turns remaining: 9 *****

 _ e _  _  _  _ 
Guess a letter!
o
Nope, o is not in the word.


***** Number of turns remaining: 8 *****

 _ e _  _  _  _ 
Guess a letter!
m
Nope, m is not in the word.


***** Number of turns remaining: 7 *****

 _ e _  _  _  _ 
Guess a letter!
n
Nope, n is not in the word.


***** Number of turns remaining: 6 *****

 _ e _  _  _  _ 
Guess a letter!
p
Nope, p is not in the word.


***** Number of turns remaining: 5 *****

 _ e _  _  _  _ 
Guess a letter!
l
Nope, l is not in the word.


***** Number of turns remaining: 4 *****

 _ e _  _  _  _ 
Guess a letter!
j
Nope, j is not in the word.


***** Number of turns remaining: 3 *****

 _ e _  _  _  _ 
Guess a letter!
k
Nope, k is not in the word.


***** Number of turns remaining: 2 *****

 _ e _  _  _  _ 
Guess a letter!
t
Good guess! t is in the word!


***** Number of turns remaining: 2 *****

 _ e _  _  _ t
Guess a letter!
s
Good guess! s is in the word!


***** Number of turns remaining: 2 *****

 _ e _  _ st
Guess a letter!
y
Nope, y is not in the word.


***** Number of turns remaining: 1 *****

 _ e _  _ st
Guess a letter!
r
Good guess! r is in the word!


***** Number of turns remaining: 1 *****

 _ er _ st
Guess a letter!
o
You've already guessed "o"! Guess again!

***** Number of turns remaining: 1 *****

 _ er _ st
Guess a letter!
q
Nope, q is not in the word.

Game over! You lose! The word was: verist

=end




