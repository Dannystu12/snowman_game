class HiddenWord
  attr_reader :word
  def initialize word
    @word = word.downcase
  end

  def letter_in_word? letter
    @word.include? letter
  end

  def display_word letters_guessed
    regex = Regexp.new "[^#{letters_guessed.to_s}]|^\w"
    @word.gsub regex, ?*
  end
end
