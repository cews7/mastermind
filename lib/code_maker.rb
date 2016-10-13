class CodeMaker
  def four_color_combination
    combo = ['y', 'b', 'r', 'g']
    color_combo = (combo * 4).shuffle.take(4).join('')
  end
end
