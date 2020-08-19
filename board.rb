require 'byebug'
require 'colorize'

class Board 
    require_relative 'pieces'
    attr_accessor :rows 
    

    def initialize()
        @sentinel = NullPiece.instance 
        start_fill()

    end

    

    def add_piece(piece, pos)

        self[pos] = piece
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


    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val 
    end

    def move_piece(start_pos, end_pos)
        
        start = @rows[start_pos[0]][start_pos[1]]
        stop  = @rows[end_pos[0]][end_pos[1]]
        
        raise if start.nil?
        raise if !stop.nil?        

        @rows[end_pos[0]][end_pos[1]] = start 
        @rows[start_pos[0]][start_pos[1]] = nil 

    end

    private 
    attr_reader :sentinel

    def start_fill()
        @rows = Array.new(8) { Array.new(8, sentinel)}
        start_rows = [0,1,6,7]
        # debugger 
        (0...@rows.length).each do |i|
            (0...@rows[0].length).each do |j|
                # puts i.to_s + ", " + j.to_s
                if start_rows.include?(i)
                    Rook.new(:color,self, [i,j])
                end
            end
        end

    end


end


b = Board.new()

# p b[[0,0]]

b.render

# b.move_piece([0,0], [3,3])

# puts""

# b.render

# p b[[0,0]]