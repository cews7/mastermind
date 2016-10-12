class CodeMaker
  # attr_reader :color_combination
  # def initialize
  #   @color_combination = color_combination
  # end

  def four_color_combination
    combination = ['y', 'b', 'r', 'g']
    1.times do rand(3)
      combination.push('y') if 0
      combination.push('b') if 1
      combination.push('r') if 2
      combination.push('g') if 3
    end
    color_combination = (combination * 4).take(4).shuffle.join('')
  end
end
