require 'pry'
class CodeMaker
  def four_color_combination
    make_color_combination
  end

private
  def make_color_combination
    combination = []
    1.times do rand(3)
      combination.push('y') if 0
      combination.push('b') if 1
      combination.push('r') if 2
      combination.push('g') if 3
    end
    color_combination = combination.shuffle.join('')
  end
end
