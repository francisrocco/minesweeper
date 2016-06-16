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
        return [row_idx, row.index(self)]
      end
    end
  end

  def reveal
  end

  def neighbors
    # returns an array of positions of neighbors
    neighbors = []

    prev_row = position[0] - 1
    curr_row = position[0]
    next_row = position[0] + 1

    (-1..1).each do |col|
      neighbors << board[prev_row, col]
    end

    (-1..1).each do |col|
      next if col == 0
      neighbors << board[curr_row, col]
    end

    (-1..1).each do |col|
      neighbors << board[next_row, col]
    end

    neighbors.reject do |position|
      position.any? { |coor| coor < 0 } ||
        position.any? { |coor| coor >= board.grid.size }
    end
  end

  def neighbor_bomb_count
    # iterates through the neighbors
    # if it finds a bomb, it adds to a count and eventually returns it
    bomb_counter = 0
    neighbors.each do |neighbor|
      bomb_counter += 1 if neighbor.bombed?
    end
    bomb_counter
  end

  def inspect
    "*" unless revealed?
    "_" if @revealed? && !@flagged? && !@bombed?
    "#{neighbor_bomb_count}" if @revealed? && neighbor_bomb_count > 0
    "F" if @flagged?
  end

end
