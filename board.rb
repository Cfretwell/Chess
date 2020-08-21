require 'byebug'
require 'colorize'

class Board 
    require_relative 'pieces'
    attr_accessor :rows 
    attr_reader :kings

    def initialize()
        @sentinel = NullPiece.instance 
        @kings = {}
        start_fill()

    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val 
    end


    def move_piece(start_pos, end_pos)
        
        raise if self[start_pos] == sentinel
        raise if self[end_pos] != sentinel        

        self[start_pos].pos = end_pos 
        self[end_pos] = self[start_pos]
        self[start_pos] = sentinel
    end

    def valid_pos?(pos) # just check coordanates 
        pos.all? {|i| i.between?(0,7)}

    end
    

    def render 
        # p @rows 
        @rows.each do |r|
            r.each do |e|
                print e.symbol + " "
            end
            puts""
        end

    end

    def empty?(pos)
        self[pos].empty?
    end

    def checkmate?(color)
        in_check?(color) && all_valid_pos(color).length == 0 
    end
    
    def in_check?(color)
        opp_color = if color == :white then :black else :white end 
        opp_chalange_pos = all_valid_pos(opp_color)
        return true if opp_chalange_pos.include?(kings[color].pos)
        false 
    end

    def all_valid_pos(color)
        arr=[]
        rows.flatten.each do |cell| 
            if cell.color == color 
                arr = arr + cell.valid_moves()
            end
        end
        arr 
    end

    private 
    attr_reader :sentinel


    def start_fill()
        @rows = Array.new(8) { Array.new(8, sentinel)}
        back_rows = [0,7]
        front_rows = [1,6]
        # debugger 
        (0...@rows.length).each do |i|
            # puts i.to_s + ", " + j.to_s
            case i 
            when 0 , 1 
                color = :black 
            when 6 , 7
                color = :white
            end
            if back_rows.include?(i)
                fill_back_row(color,i)
            elsif front_rows.include?(i)
                fill_front_row(color,i)
                # Rook.new(:white,self, [i,j])
            end

        end
        
    end

    def fill_back_row(color,row)
        peices = [ Rook, Knight, Bishop, Queen,King, Bishop, Knight, Rook]

        peices.each_with_index do |peice,j|
            
            if peice == King 
                kings[color] = peice.new(color,self,[row,j])
            else
                peice.new(color,self,[row,j])
            end
        end
    end

    def fill_front_row(color,row)
        (0..7).each do |j|
            Pawn.new(color,self,[row,j])
        end

    end

    


end


b = Board.new()

p b.in_check?(:black)

b.render
b.move_piece([1,3], [3,3])

b.render
b.move_piece([7,5], [2,2])

b.render
p b.in_check?(:black)

# # p b[[1,1]].valid_moves


# b.render

# # b.show_valid_moves([4,3])
# b.show_valid_moves([1,1])



# # b.show_valid_moves([6,3])

# b.move_piece([1,1], [3,1])

# b.show_valid_moves([3,1])
# b.show_valid_moves([0,2])

# # puts""

# b.render

# p b[[0,0]]