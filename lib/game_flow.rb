require './lib/output_messages'
require './lib/code_maker'
require 'pry'
class GameFlow
  include OutputMessages
  attr_reader :code,
  :guess,
  :guess_count,
  :t

  def initialize
    @code = CodeMaker.new.four_color_combination
    @guess_count = 0
    @t = Time.new
  end

  def guess_the_code
    @guess = gets.chomp.downcase
    if guess == code
      OutputMessages.finished_game(guess_count, guess, seconds)
    elsif guess == 'c' || guess == 'cheat'
      puts @code.upcase
    elsif guess == 'q' || guess == 'quit'
      OutputMessages.quit
    elsif guess != code
      @guess_count += 1
      elements = number_of_correct_elements(guess, code)
      positions = number_of_correct_positions(guess, code)
      OutputMessages.game_in_progress(guess, elements, positions, guess_count)
    end
    guess_the_code
  end


  def number_of_correct_elements(guess, code)
    split_guess = guess.split("")
    split_code = code.split
    (split_guess & split_code).count
  end

  def number_of_correct_positions(guess, code)
    split_guess = guess.split("")
    split_code = code.split("")
    (split_guess.zip(split_code).map {|x, y| x == y}).count(true)
  end

  def time
    t
  end
end
