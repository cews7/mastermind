require './lib/output_messages'
require './lib/code_maker'
require 'pry'
class GameFlow
  include OutputMessages
  attr_reader :code,
  :guess,
  :guess_count,
  :start_time

  def initialize
    @code = CodeMaker.new.four_color_combination
    @guess_count = 0
    @start_time = Time.new
  end

  def guess_the_code
    @guess = gets.chomp.downcase
    if guess == code
      @guess_count += 1
      OutputMessages.finished_game(guess_count, guess, start_time)
      end_game
    elsif guess == 'c' || guess == 'cheat'
      puts @code.upcase
    elsif guess == 'q' || guess == 'quit'
      # binding.pry
      OutputMessages.quit
    elsif guess != code
      @guess_count += 1
      elements = number_of_correct_elements(guess, code)
      positions = number_of_correct_positions(guess, code)
      OutputMessages.game_in_progress(guess, elements, positions, guess_count)
    end
    guess_the_code
  end

  def end_game
    final_input = gets.chomp.downcase #remove extra space
    if final_input == 'play' || 'p'
      guess_the_code
    elsif final_input == 'q' || 'quit'
      OutputMessages.quit
    end
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

  def game_win_time
    stop_time = Time.new
    @minutes = later_time.min - start_time.min
    @seconds = later_time.sec - start_time.sec
    binding.pry
  end
end
