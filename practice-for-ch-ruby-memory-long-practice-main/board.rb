require_relative 'card'

class Board
  def initialize(n)
    @grid = Array.new(n) {Array.new(n)}
    @length = n
  end

  # def [](pos)
  #   row, col = pos
  #   @grid[row][col]
  # end

  def populate
    cards = [:A, :B, :C, :D, :E, :F, :G, :H]
    cards.each do |card| 
      2.times do  
        pos = self.get_random_position
        row, col = pos
        @grid[row][col] = Card.new(card)
      end
    end
  end

  def get_random_position
    row_idx = rand(0...@length)
    col_idx = rand(0...@length)
    pos = [row_idx, col_idx]
    if @grid[row_idx][col_idx].nil?
      return pos
    else
      self.get_random_position
    end
  end

  def render
    display = []                      #represents whole grid
    @grid.each do |row|               #iterate through orignal grid
      display_row = []                #each new row
      row.each do |card|              #iterate through each row and check each card
        if card.face_up               #if card is facing up
          display_row << card.to_s    #add that card to our new row
        else
          display_row << " "          #otherwise, dont add anything
        end
      end 
      display << display_row          #after iterating through 4x, shovel all rows to new grid
    end 
    display.each { |row| p row }
  end

  def won?
    @grid.flatten.all? { |card| card.face_up }
  end

  def reveal(guessed_pos) #[row][col]
    row, col = guessed_pos 
    card = @grid[row][col] #card obj
    if !card.face_up
      card.reveal
      return card.value
    end
  end

end
