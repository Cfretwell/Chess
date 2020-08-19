require_relative 'piece.rb' 
require_relative 'slideable.rb'

class Bishop < Piece
    include Slideable 

    def symbol 
        '♝'.colorize(color)
    end

    protected 

    def move_dirs
        diag_dirs
    end


end