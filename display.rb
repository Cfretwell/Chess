
class Display
    require 'colorize'
    require_relative 'cursor.rb'
    require_relative 'board.rb'

    attr_reader :board, :cursor

    def initialize(board) 
        @board = board
        @cursor = Cursor.new([0,0], board)


    end
    

    def navigate()
        board.render()
        input = nil 
        loop do  
            input = cursor.get_input()
            show_valid_moves(cursor_moves())
            
            break if input != nil 
        end
        input 
    end

    def cursor_moves()
        board[cursor.cursor_pos].valid_moves
        # board[cursor.cursor_pos].moves
    end

    def show_valid_moves(moves)

        (0...board.rows.length).each do |i|
            (0...board.rows[0].length).each do |j|
                val = board[[i,j]].symbol 
                
                if moves.include?([i,j])
                    val = val.on_green
                end
                if cursor.cursor_pos == [i,j]
                    if cursor.selected()
                        val = val.on_yellow
                    else
                        val = val.on_blue
                    end
                end
                print val +" "
            end
            puts""
        end

    end



end


# d = Display.new()

# d.board.render 

# d.board.move_piece(:white, [6,4],[4,4])
# d.board.render 
# d.board.in_check?(:white)


# d.board.move_piece(:black, [1,3],[2,3])
# d.board.render 

# d.board.move_piece(:white, [7,5],[3,1])
# d.board.render 
# d.board.in_check?(:black)

# d.show_valid_moves(d.board[[6,5]].valid_moves()) 

# d.show_valid_moves(d.board.chalanged_pos(:white))




# d.navigate