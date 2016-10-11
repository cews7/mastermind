require './lib/output_messages'
require './lib/code_maker'
require 'pry'
class GameFlow
  include OutputMessages
  attr_reader :code,
              :guess,
              :guess_count

  def initialize
    @code = CodeMaker.new.four_color_combination
    @guess_count = 0
  end

  def guess_the_code
    @guess = gets.chomp.downcase
    until guess == code || guess == 'c' || guess == "cheat" || guess == "q" ||
      @guess_count += 1
      game_in_progress_output(guess)
      @guess = gets.chomp.downcase
    end
    if guess == code
      finished_game_output
    end
  end

  def game_in_progress_output(guess)
    correct_number_of_colors =  number_of_correct_elements(guess, code)
    correct_positions = number_of_correct_positions(guess, code)
    puts "#{guess.upcase} has #{correct_number_of_colors} correct number of colors
    with #{correct_positions} in the correct positions. You've taken #{guess_count} guess."
  end

  def number_of_correct_elements(guess, code)
    split_guess = guess.split("")
    split_code = code.split
    (split_guess & split_code).count
  end

  def cheat
    puts (@code.color_combination).upcase
  end

  def number_of_correct_positions(guess, code)
    split_guess = guess.split("")
    split_code = code.split("")
    (split_guess.zip(split_code).map {|x, y| x == y}).count(true)
  end

  def guess_count
    @guess_count
  end

  def finished_game_output
    puts "Congratulations! You guessed the sequence #{guess.upcase} in #{guess_count} over #{time}.
    Do you want to (p)lay again or (q)uit?"
  end
end
