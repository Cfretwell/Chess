
module Stepable 


    def moves()
        moves = []
        move_diffs.each do |diff|
            dx = diff[0]
            dy = diff[1]
            check_pos = [pos[0] + dx  ,  pos[1] + dy]

            if board.valid_pos?(check_pos)
                if board[check_pos].empty? ||board[check_pos].color != color 
                    moves << check_pos
                end
            end
        end
        moves 
    end

    private 

    def move_diffs()
        # should be overwriten 
        raise "stepable move diffs "
    end


end
