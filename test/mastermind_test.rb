require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  def test_game_flow_class_exists
    game = Mastermind.new
    assert_instance_of Mastermind, game
  end

  def test_number_of_correct_colors
    t = Mastermind.new
    t.code = 'yyyy'
    t.guess = 'ryry'
    assert_equal 1, t.number_of_correct_colors(t.code, t.guess)
  end

  def test_number_of_correct_positions
    t = Mastermind.new
    t.code = 'yyyy'
    t.guess = 'yryr'
    assert_equal 2, t.number_of_correct_positions(t.code, t.guess)
  end

  def test_continue_round
    t = Mastermind.new
    t.code = 'yyyy'
    t.guess = 'yrry'
    assert_equal 'YRRY', t.continue_round[0..3]
  end
end
