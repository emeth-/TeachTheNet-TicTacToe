class MasterMind
   def initialize
       intro
       getCode
       @turns_left=12
       playGame
   end
   def intro
       puts "Welcome to MasterMind!"
       puts ""
       puts "You must guess the"\
       " secret code in 12 turns or less.  The code is a"\
       " 4 item combination of letters, ranging from A-F"\
       "(Ex: ABCD, AACF, FEAB), etc."
       puts " "
       puts "If you guess the correct letter in the wrong place, "\
       "you will get a \"W\" (wrong).  If you guess the correct letter "\
       "in the correct place, you will get a \"R\" (right).  Good luck!"
       puts " "
   end
   
   def getCode
       #generate the random code to start the game
       code=[]
       4.times do
           code << (rand(6).ceil + 65).chr
       end
       @code=code.to_s
       puts @code
   end
   
   def playGame
       catch (:done) do
           while @turns_left > 0
                puts "You have #{@turns_left} remaining! Enter your guess: "
                guess=gets.chomp.upcase
                result=checkGuess(guess)
                if result == "RRRR"
                    puts "You win!!!!"
                    puts "You guessed the correct code, #{@code} in #{13-@turns_left} turns!"
                    puts ""
                    throw :done
                else
                    puts "Guess: #{guess}        Result: #{result}"
                end
                @turns_left -=1
            end
            puts "Sorry, you didn't guess the correct code in 12 turns. You Lose."
            if !(play_again?)
                throw :done
            end
        end
   end
   
   def play_again?
      puts "Play again? (Y/N)"
            answer=gets.chomp.upcase
            if answer == 'Y'
                MasterMind.new
            else
                throw :done
            end 
   end
   
   def checkGuess(guess)
      result=[]
      guess.split('').each_with_index { |char,index|
          if @code.include?(char)
              if @code[index] == guess[index]
                  result << "R"
              else
                  result << "W"
              end
          end
  }
      result.to_s 
   end
   
   
end
MasterMind.new
