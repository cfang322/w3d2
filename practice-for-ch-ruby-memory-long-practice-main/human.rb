def HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_input
    return gets.chomp.split(" ").map(&:to_i) 
  end

end