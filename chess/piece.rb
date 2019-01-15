class Piece
  def initialize(color)
    @color = color
    # @color = [:white, :black]
    # @board = board
  end
end

class NullPiece < Piece
  def initialize
  end
end