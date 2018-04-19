require 'minitest/autorun'
require 'minitest/rg'
require_relative '../player.rb'
class PlayerTest < MiniTest::Test

  def setup
    @player1 = Player.new "Daniel", 3
  end

  def test_name
    assert_equal "Daniel", @player1.name
  end

  def test_lives
    assert_equal 3, @player1.lives
  end

  def test_reduce_lives__lives_left
    @player1.reduce_lives
    assert_equal 2, @player1.lives
  end

  def test_reduce_lives__no_lives_left
    4.times{@player1.reduce_lives}
    assert_equal 0, @player1.lives
  end
end
