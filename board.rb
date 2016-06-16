class Board
  attr_reader :size
  attr_accessor :grid

  def initialize(size = 9)
    @size = size
  end

  def create_grid(size)
    @grid = Array.new(size) { Array.new(size) }
  end

  def populate
    @grid.map! { |tile| tile = Tile.new(self) }
    num_bombs = ( size ** 2 ) / 4
    num_bombs.times do
      row = rand(size)
      col = rand(size)
      until board[row, col].bombed? == false
        row = rand(size)
        col = rand(size)
      end
      board[row, col] = true
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
