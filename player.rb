class Player
  attr_reader :name, :lives

  def initialize name, lives
    @name, @lives = name, lives
  end

  def reduce_lives
    @lives -= 1 if @lives > 0
  end

end
