require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_flow'
require 'pry'

class GameFlowTest < Minitest::Test
  def test_game_flow_class_exists
    play = GameFlow.new
    assert_instance_of GameFlow, play
  end

  def test_game_flow_output_works
    play = GameFlow.new
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed,\n
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.", play.guess_the_code
  end
end
