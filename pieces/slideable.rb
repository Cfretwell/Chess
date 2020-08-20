module Slideable
    HORZ_AND_VER_DIRS = [
        [1,0],[-1,0],
        [0,1],[0,-1]
    ].freeze 

    DIAG_DIRS = [
        [1,1],
        [1,-1],
        [-1,1],
        [-1,-1]
    ].freeze

    def horz_and_ver_dirs 
        HORZ_AND_VER_DIRS
    end
    
    def diag_dirs 
        DIAG_DIRS
    end

    def moves
        # will retrurn arr of all possible moves 
        moves = []
        move_dirs.each do |dir|
            # p dir
            moves = moves + grow_unblocked_moves_in_dir(dir)
        end
        moves 
    end

    private 

    def move_dirs
        # overwriten by subclass?
        # shows which DIRS to call via variables? 
        raise 'should have overritten - moveDirs' 
    end

    def grow_unblocked_moves_in_dir(dir)
        dx = dir[0]
        dy = dir[1]
        moves =[]
        check_pos = [pos[0] + dx  ,  pos[1] + dy]

        while board.valid_pos?(check_pos) 

            if board.empty?(check_pos)
                moves << check_pos
            else
                moves << check_pos if board[check_pos].color != color 
                break
            end
            check_pos = [check_pos[0] + dx, check_pos[1] + dy]
        end
        moves 
    end

end