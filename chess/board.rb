require_relative 'piece.rb'
require_relative 'display.rb'
require_relative 'errors.rb'

class Board
  attr_accessor :grid
  def self.default_grid
    empty_grid = Array.new(8) {Array.new(8)}
    (0..1).each do |row|
      empty_grid[row].each_index {|col| empty_grid[row][col] = Piece.new(:black)} 
    end

    (6..7).each do |row|
      empty_grid[row].each_index {|col| empty_grid[row][col] = Piece.new(:white)} 
    end
    
    (2..5).each do |row|
      empty_grid[row].each_index {|col| empty_grid[row][col] = NullPiece.new} 
    end
    
    empty_grid
  end

  def initialize
    @grid = Board.default_grid
  end

  def move_piece(start_pos,end_pos)
    raise NoPieceError if self.grid[start_pos].is_a?(NullPiece)
    raise CannotMoveThereError if self.grid[end_pos].is_a?(Piece)
    moving_piece = self.grid[start_pos]
    self.grid[end_pos] = moving_piece
    self.grid[start_pos] = NullPiece.new
  end

  def [](pos)
    row, col = pos
    self.grid[row][col]
  end

  def []=(piece)
    row, col = pos
    self.grid[row][col] = piece
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
end