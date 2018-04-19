require 'minitest/autorun'
require 'minitest/rg'
require_relative '../hidden_word.rb'
class HiddenWordTest < MiniTest::Test

  def setup
    @hidden_word = HiddenWord.new "Racecar"
  end

  def test_word
    assert_equal "racecar", @hidden_word.word
  end

  def test_letter_in_word__true
    assert_equal true, @hidden_word.letter_in_word?('r')
  end

  def test_letter_in_word__false
    assert_equal false, @hidden_word.letter_in_word?('z')
  end

  def test_display_word
    display = @hidden_word.display_word ['a', 'e']
    assert_equal "*a*e*a*", display
  end
end
