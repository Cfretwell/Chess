require 'byebug'
require 'colorize'

class Board 
    require_relative 'pieces'
    attr_accessor :rows 
    

    def initialize()
        @sentinel = NullPiece.instance 
        start_fill()

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

    def valid_pos?(pos) # just check coordanates 
        pos.all? {|i| i.between?(0,7)  }

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

    def empty?(pos)
        self[pos].empty?
    end
    
    def show_valid_moves(pos)
        return nil if empty?(pos)

        moves = self[pos].valid_moves

        (0...@rows.length).each do |i|
            (0...@rows[0].length).each do |j|
                val = self[[i,j]].symbol 
                
                if moves.include?([i,j])
                    val = val.on_green
                end
                print val +" "
            end
            puts""
        end

    end
    

    private 
    attr_reader :sentinel

    def start_fill()
        @rows = Array.new(8) { Array.new(8, sentinel)}
        black_rows = []
        white_rows = [6]
        # debugger 
        (0...@rows.length).each do |i|
            (0...@rows[0].length).each do |j|
                # puts i.to_s + ", " + j.to_s
                if black_rows.include?(i)
                    Rook.new(:black,self, [i,j])
                elsif white_rows.include?(i)
                    Rook.new(:white,self, [i,j])
                end

            end
        end

        Queen.new(:black,self, [1,1])

    end

    


end


b = Board.new()

# b[[0,0]].valid_moves


b.render

b.show_valid_moves([1,1])

# b.show_valid_moves([6,3])

# b.move_piece([0,0], [3,3])

# puts""

# b.render

# p b[[0,0]]