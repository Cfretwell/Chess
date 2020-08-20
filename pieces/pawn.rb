require_relative 'piece.rb'

class Pawn < Piece
    

    def symbol
        '♟'.colorize(color)

    end

    def moves()
        moves = forward_steps
        
        moves = moves + side_attacks
        


        p moves
    end

    protected 


    def at_start_row?
        if color == :white
            return pos[0] == 6
        else
            return pos[0] == 1
        end
    end


    def forward_dir
        case color 

        when :white
            return -1
        when :black
            return 1
        end
        p color 
        raise "wrong color pawn!"
    end

    def forward_steps 
        f_steps = []
        forward = [pos[0]+forward_dir,pos[1]]
        if board.empty?(forward)
            f_steps << forward 
            forward_2 = [forward[0]+forward_dir, pos[1]]
            if board.empty?(forward_2) && at_start_row?()
                f_steps << forward_2
            end
        end
        f_steps 
    end


    def side_attacks
        l = [pos[0]+forward_dir, pos[1]+1 ]
        r = [pos[0]+forward_dir, pos[1]-1 ]

        attacks = [l,r]

        attacks.select do |side|
            !board.empty?(side) && board[side].color != color 
        end
    end


end



