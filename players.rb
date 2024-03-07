class Players
  attr_accessor :name, :life #getter , setter to access outside class
  def initialize(name,life)
    @name=name
    @life=life
  end

  #to deduct palyers life when he mis-answers
  def remaining_life
    @life -= 1
  end 
end
