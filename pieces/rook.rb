
require_relative 'piece.rb' 
require_relative 'slideable.rb'

class Rook < Piece
    include Slideable 

    def symbol 
        'x'.colorize(color)
    end

    protected 

    def move_dirs
        horz_and_ver_dirs
    end


end