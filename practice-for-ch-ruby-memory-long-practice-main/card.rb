class Card

  def initialize(value)
    @value = value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal?
    @face_up = true
  end

  def value
    @value if @face_up == true
  end

  def to_s
    @value.to_s 
  end

  def ==(card)
    @value == card.value 
  end

end
