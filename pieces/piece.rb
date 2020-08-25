
class Piece 

    attr_reader :board, :color
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos
        board[pos] = self 
    end

    def empty?
        false 
    end

    def valid_moves
        # return all valid moves 
        can_move = moves()
        # reject if moves into check 
        can_move.select do |m|
            !move_into_check?(m)
        end
    end

    private 

    def move_into_check?(end_pos)
        # will check if moving this peice will put in check  
        b2 = board.dup 
        b2.move_piece!(color, pos, end_pos)
        b2.in_check?(color)
    end


end


