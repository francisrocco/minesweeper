class Tile

  attr_reader :board
  attr_accessor :bombed?, :flagged?, :revealed?, :position

  def initialize(board)
    @board = board
    @bombed? = false
    @flagged? = false
    @revealed? = false
  end

  def position
    board.grid.each_with_index do |row, row_idx|
      if row.include?(self)
        row.index(self)
      end
    end
  end

  def reveal
  end

  def neighbors
    # returns an array of positions of neighbors

  end

  def neighbor_bomb_count
    # iterates through the neighbors
    # if it finds a bomb, it adds to a count and eventually returns it
  end

  def inspect
    "*" unless revealed?
    "_" if @revealed? && !@flagged? && !@bombed?
    "#{neighbor_bomb_count}" if @revealed? && neighbor_bomb_count > 0
    "F" if @flagged?
  end

end
