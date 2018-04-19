class Game
  attr_reader :player, :hidden_word, :guesses

  def initialize player, hidden_word
    @player, @hidden_word, @guesses = player, hidden_word, []
  end

  def make_guess guess
    @guesses.push guess if !@guesses.include? guess
    @player.reduce_lives if !@hidden_word.letter_in_word? guess
  end

  def won?
    @hidden_word.display_word(@guesses) == @hidden_word.word
  end

  def lost?
    @player.lives == 0
  end

  def display_word
    @hidden_word.display_word @guesses
  end

end
