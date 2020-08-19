
class Piece 

    attr_reader :board, :color

    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos

        @board.add_piece(self, pos)
    end


    def empty?
        false 
    end

    def valid_moves
        # return all valid moves 

        # reject if moves into check 

    end

    def pos=(val)

    end

    private 

    def move_into_check?(end_pos)
        # will check if moving this peice will put in check 

    end


end


