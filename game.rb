require_relative 'display.rb'
require_relative 'human_player.rb'


class Game 

    attr_accessor :display, :board, :current_player

    attr_reader  :players 

    def initialize(p1, p2)
        @board = Board.new(true)
        @display = Display.new(board) 
        @players = {:white => p1.name, :black => p2.name}
        @current_player = :white
        play()
        

    end

    def play()
        puts "Welcome to chess!"
        
        loop do 
            puts "It is #{current_player}'s turn"
            board.render
            move = get_move()
            p move
            board.move_piece(current_player, move[0], move[1])
            # board.render
            break if board.in_check?(:white)
            break if board.in_check?(:black)
            player_swich() 
        end
        

    end

    def player_swich()
        if current_player == :white 
            p "switch w"
            @current_player = :black 
        else 
            @current_player =:white 
        end 
    end

    def get_move()
        loc = get_loc()
        end_loc = get_end_loc(loc_options = board[loc].valid_moves())
        return [loc, end_loc]
    end

    def get_end_loc(valid_ends)
        puts "please select an end location"

        invalid_loc =true 
        while invalid_loc
            end_loc = display.navigate
            if valid_ends.include?(end_loc)
                invalid_loc = false  
            else 
                puts "invalid end location! Please enter a position out of:"
                p valid_ends
            end

        end
        end_loc
    end

    def get_loc()
        invalid_loc = true 
        while invalid_loc 
            loc = display.navigate
            if board[loc].color != current_player 
                puts "wrong color!"
            elsif board[loc].valid_moves().length <1
                puts "that piece cant move anywhere!"
            else 
                invalid_loc = false 
            end
        end    
        loc 
        
    end




end

p1 = Human_player.new("tom")
p2 = Human_player.new("greg")

g = Game.new(p1, p2)