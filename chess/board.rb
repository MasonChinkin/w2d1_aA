require_relative "piece"
require_relative "display"
require_relative "errors"
require_relative "cursor"

require "colorize"
require "byebug"

class Board
  attr_accessor :grid
  def self.default_grid
    start_grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    (0..1).each do |row|
      start_grid[row].each_index do |col|
        start_grid[row][col] = Piece.generate(self, [row, col], :dark)
      end
    end

    (6..7).each do |row|
      start_grid[row].each_index do
        |col| start_grid[row][col] = Piece.generate(self, [row, col], :light) end
    end

    start_grid
  end

  def populate_pieces
  end

  def initialize
    @grid = Board.default_grid
  end

  def move_piece(start_pos, end_pos)
    if valid_move?(start_pos, end_pos)
      moving_piece = self[start_pos]
      self[end_pos] = moving_piece
      self[start_pos] = NullPiece.new
    end
  end

  # private
  def valid_move?(start_pos, end_pos)
    # raise NoPieceError if self[start_pos].is_a?(NullPiece)
    # raise CannotAttackFriendlyError if self[start_pos].color == self[end_pos].color
    # raise InvalidAttackError if
    # raise OffBoardError if
    true
  end

  def [](pos)
    row, col = pos
    self.grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    self.grid[row][col] = piece
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  cursor = Cursor.new([0, 0], board)
  display = Display.new(board, cursor)
  display.render

  until cursor.selected
    cursor.get_input
    system("clear")
    display.render
  end
end
