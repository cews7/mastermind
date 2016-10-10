require './lib/output_messages'
require './lib/code_maker'
require 'pry'
class Play
  include OutputMessages
  attr_reader :code

  def initialize
    @code = CodeMaker.new.four_color_combination
  end

  def guess_the_code(code)
    OutputMessages.prompt_to_guess
    guess = gets.chomp.downcase
    while guess != code || guess != 'c' || guess != 'cheat'
      game_in_progress
      if guess == code
        game_finished
      end
    end
  end

  def game_in_progress
    puts "#{guess.upcase} has #{number_of_correct_elements}
    with #{number_of_correct_positions} in the correct positions. You've taken #{guess_count} guess."
  end

  def game_finished
    puts "Congratulations! You guessed thte sequence #{guess.upcase} in #{guess_count} over #{time}.
    Do you want to (p)lay again or (q)uit?"
  end
end
