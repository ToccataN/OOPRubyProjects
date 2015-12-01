#Tic Tac Toe 
require 'set'
module TicTacToe
LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
# build class representing table.
  class Game
  	   def initialize (player_1, player_2)
  		@board = Array.new(10)
        @current_player_id = 0
         @players = [player_1.new(self, "X"), player_2.new(self, "O")]
         puts "#{current_player} goes first."
        end
       attr_reader :board, :current_player_id
       
       def display
        s1= "|"
        s2 = "=====" 
        position= lambda {|x| @board[x] ? @board[x] : x}
        row = lambda {|row| row.map(&position).join(s1)}
        rpos=[[1,2,3],[4,5,6],[7,8,9,]]
        rdisp=rpos.map(&row)
        puts rdisp.join("\n"+s2+"\n")
        
        end
        def play
    	
    	  loop do
    		place_marker(current_player)
    		if player_wins(current_player)
    			puts "#{current_player} wins"
    			display
    			return
    		elsif board_full?
    			puts "It is a draw"
    			display
    		    return
    		end
    		switch_players!
    	  end
        end
        def place_marker(player)
            position = player.select_position!
            puts "#{player} selects #{player.marker} position #{position}"
            @board[position] = player.marker
        end
    	def free_positions
           Set.new((1..9).select {|position| @board[position].nil?})
        end
    	def player_wins (player)
    		LINES.any? do |line|
            line.all? {|position| @board[position] == player.marker}
          end
        end
        def board_full?
        	free_positions.empty?
    	end
    	def switch_players!
        @current_player_id = other_player_id
        end
            def other_player_id
            1 - @current_player_id
            end
        def current_player
             @players[current_player_id]
        end
        def opponent
         @players[other_player_id]
        end
        turns=9
  end
  class Player
     attr_reader  :marker
     def initialize (game, marker)
     	
     	@marker=marker
     	@game=game
     end
  end
  class PlayerMe < Player
  	def select_position!
      @game.display
      loop do
        print "Select your #{marker} position: "
        selection = gets.to_i
        return selection if @game.free_positions.include?(selection)
        puts "Position #{selection} is not available. Try again."
      end
    end
    def to_s
    	"player1"
    end
  end
   class PlayerYou < Player
  	def select_position!
      @game.display
      loop do
        print "Select your #{marker} position: "
        selection = gets.to_i
        return selection if @game.free_positions.include?(selection)
        puts "Position #{selection} is not available. Try again."
      end
    end
    def to_s
    	"player2"
    end
  end
   
end


include TicTacToe
 

Game.new(PlayerMe, PlayerYou).play









