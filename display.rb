
class Display
    require 'colorize'
    require_relative 'cursor.rb'
    require_relative 'board.rb'

    attr_reader :board, :cursor

    def initialize 
        @board = Board.new()
        @cursor = Cursor.new([0,0], board)


    end
    

    def navigate()
        while cursor.get_input() == nil 
            show_valid_moves(cursor.cursor_pos)
        end

    end


    def show_valid_moves(pos)
        # return nil if board.empty?(pos)

        moves = board[pos].valid_moves

        (0...board.rows.length).each do |i|
            (0...board.rows[0].length).each do |j|
                val = board[[i,j]].symbol 
                
                if moves.include?([i,j])
                    val = val.on_green
                end
                if pos == [i,j]
                    val = val.on_blue
                end
                print val +" "
            end
            puts""
        end

    end



end


d = Display.new()

d.navigate




