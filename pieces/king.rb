require_relative 'piece.rb'
require_relative 'stepable.rb'

class King < Piece
    include Stepable

    def symbol
        '♚'.colorize(color)

    end

    protected 


    def move_diffs
        moves = [
        [1,1],
        [0,1],
        [-1,1],
        [-1,0],
        [-1,-1],
        [0,-1],
        [1,-1],
        [1,0],
        ]

    end


end



