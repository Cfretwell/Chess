

class Board 
    require_relative 'piece.rb'

    def initialize()
        @rows = Array.new(8) { Array.new(8)}
        start_rows = [0,1,6,7]
        (0...@rows.length).each do |i|
            (0...@rows[0].length).each do |j|
                # puts i.to_s + ", " + j.to_s
                if start_rows.include?(i)
                    @rows[i][j] = Piece.new()
                end
            end
        end

    end

    attr_accessor :rows 

    def render 
        @rows.each {|r| p r }
    end


    def move_piece(start_pos, end_pos)
        
        start = @rows[start_pos[0]][start_pos[1]]
        stop  = @rows[end_pos[0]][end_pos[1]]
        
        raise if start.nil?
        raise if !stop.nil?        

        @rows[end_pos[0]][end_pos[1]] = start 
        @rows[start_pos[0]][start_pos[1]] = nil 

    end



end


# b = Board.new()
# b.render

# b.move_piece([0,3], [0,0])

# puts""

# b.render