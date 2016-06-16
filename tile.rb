class Tile

  attr_reader :board
  attr_accessor :bombed?, :flagged?, :revealed?

  def initialize(board)
    @board = board
    @bombed? = false
    @flagged? = false
    @revealed? = false
  end

  def reveal
  end

  def neighbors
  end

  def neighbor_bomb_count
  end

  def inspect
    "*" unless revealed?
    "_" if @revealed? && !@flagged? && !@bombed?
    "#{neighbor_bomb_count}" if @revealed? && neighbor_bomb_count > 0
    "F" if @flagged?
  end

end
