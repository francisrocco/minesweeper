class Minesweeper
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def run
    board.create_grid
    board.populate
    # play until game_over?

  end

end
