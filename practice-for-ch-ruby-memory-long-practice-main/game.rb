require_relative 'board.rb'
require_relative 'card.rb'

class Game
  def initialize(n)
    @board = Board.new(n)
    @prev_guess = nil
  end

  def play
    while @board.won? == false
      system("clear")
      @board.render
      pos = gets.chomp.split(" ").map(&:to_i)
      self.make_guess(pos)
    end
    puts "you win!!!!!!!!!! :)"
  end

  def make_guess(pos)
    if @prev_guess == nil
      @prev_guess = pos
      @board.reveal(pos) #card.face_up = true, returns card value
    elsif @prev_guess != nil
      @board.reveal(pos)
      @board.render

      if @board[@prev_guess].value != @board[pos].value #checking if the val of our prev guess is equel to our current guess value
        sleep(3)
        @board[@prev_guess].hide       #card object
        @board[pos].hide
        @prev_guess = nil
      else
        @prev_guess = nil
      end
    end
  end


end
