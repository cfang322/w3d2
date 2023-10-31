require_relative 'card'

class Board
  def initialize(n)
    @grid = Array.new(n) {Array.new(n)}
    @length = n
  end

  # def []
  #   row, col = pos
  #   @grid[row][col]
  # end

  def populate
    cards = [:A, :B, :C, :D, :E, :F, :G, :H]
    cards.each do |value|
        pos = self.get_random_position
        col, row = pos
        @grid[row][col] = Card.new(value)
        pos = self.get_random_position
        col, row = pos
        @grid[row][col] = Card.new(value)
    end
  end

  def get_random_position
    row_idx = rand(0...@length)
    col_idx = rand(0...@length)
    # pos = [row_idx, col_idx]
    if @grid[row_idx][col_idx].nil?
      return [row_idx, col_idx]
    else
      self.get_random_position
    end
  end
end
