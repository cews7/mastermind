require './lib/output_messages'
require './lib/code_maker'
class Mastermind
  include OutputMessages
  attr_accessor :code,
                :guess,
                :guess_count,
                :start_time

  def initialize
    @guess_count = 0
    @start_time = Time.new
    @code = CodeMaker.new.four_color_combination
  end

  def start_game
    OutputMessages.welcome_messages
    input = gets.chomp.downcase
    until input == "q" || input == "quit"
      OutputMessages.instructions if input == "i" || input == "instructions"
      OutputMessages.new_game if input == "p" || input == "play"
      guess_the_code if input == "p" || input == "play"
      puts "invalid input" if input.start_with?("p", "i", "q") == false
      input = gets.chomp.downcase
    end
    exit
  end

  def guess_the_code
    @guess = gets.chomp.downcase
    complete_round if guess == code
    puts "the code is: #{code.upcase}" if guess == "c" || guess == "cheat"
    exit if guess == "q" || guess == "quit"
    continue_round if guess != code && guess != "c" && guess != "cheat"
    guess_the_code
  end

  def number_of_correct_positions(guess, code)
    split_guess = guess.split("")
    split_code = code.split("")
    (split_guess.zip(split_code).map {|x, y| x == y}).count(true)
  end

  def number_of_correct_colors(guess, code)
    split_guess = guess.split("")
    split_code = code.split("")
    (split_guess & split_code).count
  end

  def continue_round
    @guess_count += 1
    colors = number_of_correct_colors(guess, code)
    positions = number_of_correct_positions(guess, code)
    OutputMessages.game_in_progress(guess, colors, positions, guess_count)
  end

  def complete_round
    @guess_count += 1
    OutputMessages.finished_game(guess_count, guess, start_time)
    end_game
  end

  def end_game
    input = gets.chomp.downcase
    Mastermind.new.start_game if input == "m" || input == "menu"
    exit if input == "q" || input == "quit"
    puts "invalid input"
    end_game
  end
end
Mastermind.new.start_game
