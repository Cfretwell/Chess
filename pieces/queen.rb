require_relative 'piece.rb' 
require_relative 'slideable.rb'

class Queen < Piece
    include Slideable 

    def symbol 
        '♛'.colorize(color)
    end

    protected 

    def move_dirs
        diag_dirs + horz_and_ver_dirs
    end


end