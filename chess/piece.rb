require_relative 'cursor.rb'

require 'singleton'

class Piece
  COLORS = [:black, :red]
  attr_reader :color
  def initialize(color)
    @color = color
  end

  def to_s
      return ' ♟ '.colorize(COLORS[0]) if self.color == COLORS[0]
      return ' ♟ '.colorize(COLORS[1]) if self.color == COLORS[1]
  end

  def inspect
    # p @color
    p self.object_id
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