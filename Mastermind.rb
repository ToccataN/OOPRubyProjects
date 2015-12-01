#Mastermind
module Mastermind
@@colors=["r","g","b","y","o","p"]

#Set up board with an array hold 4 postitions.
#var color
#var position
  class Game 
  	def initialize (player_1)
  		@board= Array.new
  		@player = [player_1.new(self)]
  		@points = 0
    end
    attr_reader :board, :points
    def display
    	post= "|"
    	positions= lambda {|x|  x}
    	rar = ["X","X","X","X"]
        rdisp = rar.map(&positions)
        puts rdisp.join(" "+post+" ")
    end
    def start 
    	4.times do 
    		@board << @@colors.sample
    	end
    	return @board

    end
    def play 
        start
        12.times do
    	   display
    	   guess
    	   if @player_guess ==@board
           
    	   	return
    	   end
        end
      puts "You Lose...#{@board}"
        
    	    

    end
    def guess
    	
    	print "Try to guess the pattern: "
    	@player_guess =Array.new
        intersect = Hash[@board.map.with_index.to_a]
    	guess_values = Hash[@player_guess.map.with_index.to_a]
    	board_values = Hash[@board.map.with_index.to_a]
    	4.times do 
    		@player_guess<<gets.chomp
    	end
    	intersection = @player_guess&@board

    	
    	if @player_guess == @board
    		print "Player wins!"
    		@points += 10
    		print "\n#{@points}\n"
    		
    	elsif intersection.length >0
    	  points= @points
          @points = 1+points
          print "\n board index for first item in intersected array: #{intersect[intersection[0]]}\n"

    	else intersection.length ==nil
    		@points-=1

    	end
    	print "\n #{intersection}\n"
    	   
    	 
    	 print "\npoints: #{@points}\n"
      
    	 
    end
  end
  class Player
  	def initialize (game)
  		@game= game
  	end
  end
  class Human < Player
  	def to_s
  		"Human"
  	end
  end
  class Computer < Player
  	def to_s
  		"Computer"
  	end
    

  end

  

end


#colored pegs generated with Rand(1...6) to fill each index in array.


#loop
#The player enters in an array of 4 colors. if if the color and postition match the board (all?), the player wins
# if the player guesses a correct color and postion (if any?) then the computer returns a true on that array, with the correct position marked with elementsx
# if none correct, computer gets 1 point
#at end of each turn, computer gets a point




include Mastermind

Game.new(Human).play

