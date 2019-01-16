require 'singleton'
require_relative 'modules.rb'

class Piece
  attr_reader :color, :board, :piece_pos
  def initialize(board, piece_pos, color)
    @board = board 
    @color = color
    @piece_pos = piece_pos
  end
 
  def self.generate(board, pos, color)
    pawns = []
    8.times {|i| pawns << [1,i]; pawns << [6,i]}
    rooks = [[0,0],[0,7],[7,0],[7,7]]
    knights = [[0,1],[0,6],[7,1],[7,6]]
    bishops = [[0,2],[0,5],[7,2],[7,5]]
    queens = [[0,3],[7,3]]
    kings = [[0,4],[7,4]]
    
    if pawns.include?(pos)
      Pawn.new(board, pos, color)
    elsif rooks.include?(pos)
      Rook.new(board, pos, color)
    elsif knights.include?(pos)
      Knight.new(board, pos, color)
    elsif bishops.include?(pos)
      Bishop.new(board, pos, color)
    elsif queens.include?(pos)
      Queen.new(board, pos, color)
    elsif kings.include?(pos)
      King.new(board, pos, color)
    end
  end

  def inspect
    p @color
  end
end

class Pawn < Piece
  def initialize(board, piece_pos, color)
    super
  end

  def to_s
      return ' ♟ ' if self.color == :dark
      return ' ♙ ' if self.color == :light
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(board, piece_pos, color)
    super
  end

  def to_s
      return ' ♜ ' if self.color == :dark
      return ' ♖ ' if self.color == :light
  end
end

class Bishop < Piece
  include SlidingPiece
  
  def initialize(board, piece_pos, color)
    super
  end

  def to_s
      return ' ♝ ' if self.color == :dark
      return ' ♗ ' if self.color == :light
  end
end

class Knight < Piece
  include SlidingPiece

  def initialize(board, piece_pos, color)
    super
  end

  def to_s
      return ' ♞ ' if self.color == :dark
      return ' ♘ ' if self.color == :light
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(board, piece_pos, color)
    super
  end

  def to_s
      return ' ♛ ' if self.color == :dark
      return ' ♕ ' if self.color == :light
  end
end

class King < Piece
  include SteppingPiece

  def initialize(board, piece_pos, color)
    super
  end

  def to_s
      return ' ♚ ' if self.color == :dark
      return ' ♔ ' if self.color == :light
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = ' '
  end

  def to_s
    return '   '
  end

  # def inspect
  # end
end