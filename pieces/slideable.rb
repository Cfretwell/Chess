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


        


    end

    private 

    def move_dirs
        # overwriten by subclass?
        # shows which DIRS to call via variables? 
        raise 'should have overritten - moveDirs' 
    end

    def grow_unblocked_moves_in_dir(dx, dy)


    end



end