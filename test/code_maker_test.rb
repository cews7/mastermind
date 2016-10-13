require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_maker'
class CodeMakerTest < Minitest::Test
  def test_code_maker_works
    code = CodeMaker.new
    colors = code.four_color_combination
    assert_equal 4, colors.size
    refute colors.include?('1234567890')
    assert colors.include?('y' || 'b' || 'g' || 'r')
  end
end
