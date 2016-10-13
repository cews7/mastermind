require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'
class CodeMakerTest < Minitest::Test
  def test_code_maker_works
    code = CodeMaker.new
    colors = code.four_color_combination
    assert_equal 4, colors.size
    colors.each_char { |letter| assert "ybgr".include?(letter) }
  end
end
