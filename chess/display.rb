require_relative 'board.rb'
require 'colorize'

require 'byebug'

class Display
  TILE_COLORS = [:cyan, :white, :yellow, :red] # TILE_COLORS[2] == cursor
  attr_reader :board, :cursor
  def initialize(board, cursor)
    @board = board
    @cursor = cursor
  end

  def render
    temp = ''
    (0..7).each do |i|
      (0..7).each do |j|
          piece = board.grid[i][j]
          if [i,j] == self.cursor.cursor_pos && self.cursor.selected == false
            temp += piece.to_s.colorize(:color => piece.color, :background => TILE_COLORS[2])
          elsif [i,j] == self.cursor.cursor_pos && self.cursor.selected == true
            temp += piece.to_s.colorize(:color => piece.color, :background => TILE_COLORS[3])
          elsif (i.even? && j.even?) || (i.odd? && j.odd?) 
            temp += piece.to_s.colorize(:color => piece.color, :background => TILE_COLORS[0])
          else
            temp += piece.to_s.colorize(:color => piece.color, :background => TILE_COLORS[1])
          end
        end
        puts temp
        temp = ''
      end
  end
end