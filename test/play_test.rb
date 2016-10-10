require 'minitest/autorun'
require 'minitest/pride'
require './lib/play'
require 'pry'

class PlayTest < Minitest::Test

  def test_play_class_exists
    play = Play.new
    assert_instance_of Play, play
  end

  def test_play_output_works
    play = Play.new
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed,\n
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.", play.start_output
  end
end
