class Board
  attr_reader :size
  attr_accessor :grid

  def initialize(size = 9)
    @size = size
  end

  def create_grid(size)
    @grid = Array.new(size) { Array.new(size) { Tile.new(self) } }
  end

  def populate
    num_bombs = ( size ** 2 ) / 4
    num_bombs.times do

    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, input)
    row, col = pos
    grid[row][col] = input
  end

  def render

  end

end
