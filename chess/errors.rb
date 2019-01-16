class NoPieceError < StandardError
  def message
    puts "There is no piece here silly!"
  end
end

class CannotAttackFriendlyError < StandardError
  def message
    puts "Thats your friend! Dont be a jerk!"
  end
end

class InvalidAttackError < StandardError
  def message
    puts "This piece cannot attack there"
  end
end

class OffBoardError < StandardError
  def message
    puts "Stay on the board!"
  end
end
