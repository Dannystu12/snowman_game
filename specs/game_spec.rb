require 'minitest/autorun'
require 'minitest/rg'
require_relative '../game.rb'
require_relative '../player.rb'
require_relative '../hidden_word.rb'

class GameTest < MiniTest::Test
  def setup
    @player1 = Player.new "Daniel", 3
    @hidden_word1 = HiddenWord.new "Racecar"
    @game1 = Game.new @player1, @hidden_word1
  end

  def test_player
    assert_equal @player1, @game1.player
  end

  def test_hidden_word
    assert_equal @hidden_word1, @game1.hidden_word
  end

  def test_guesses
    assert_equal [], @game1.guesses
  end

  def test_make_guess__correct
    @game1.make_guess "r"
    assert_equal true, @game1.guesses.include?("r")
    assert_equal 3, @player1.lives
    assert_equal "r*****r", @hidden_word1.display_word(@game1.guesses)
  end

  def test_make_guess__incorrect
    @game1.make_guess "z"
    assert_equal true, @game1.guesses.include?("z")
    assert_equal 2, @player1.lives
    assert_equal "*******", @hidden_word1.display_word(@game1.guesses)
  end

  def test_game_won__true
    @game1.make_guess "r"
    @game1.make_guess "a"
    @game1.make_guess "c"
    @game1.make_guess "e"
    assert_equal true, @game1.won?
  end

  def test_game_won__false
    assert_equal false, @game1.won?
  end

  def test_game_lost__true
    4.times{@game1.make_guess "z"}

    assert_equal true, @game1.lost?
  end

  def test_game_lost__false
    assert_equal false, @game1.won?
  end

  def test_display_word
    assert_equal "*******", @game1.display_word
    @game1.make_guess "r"
    assert_equal "r*****r", @game1.display_word
  end

end
