require 'pry'
module OutputMessages
  extend self
  def introduction
    puts "Welcome to MASTERMIND\n\n"
  end

  def selection
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "\t\t\t**MASTERMIND INSTRUCTIONS**\n\n
    1. Guess the randomly generated set of colors(red, green, blue, yellow)
    \ta. This set is four characters in length
    \tb. The player has unlimited attempts to guess
    2. Guess the correct values and you win"
  end

  def quit
    exit
  end

  def new_game
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game.\n"
  end

  def prompt_to_guess
    puts "\nGuess the secret code as many times as you'd like. Should you get bored, you can (c)heat."
    print "Enter guess: "
  end

  def game_in_progress(guess, number_of_correct_elements, number_of_correct_positions, guess_count)
    if guess.length > 4
      puts "guess is too long"
    elsif guess.length < 4
      puts "guess is too short"
    else
      puts "#{guess.upcase} has #{number_of_correct_elements} correct number of colors with #{number_of_correct_positions} in the correct positions. You've taken #{guess_count} guess."
    end
  end

  def finished_game(guess_count, guess, start_time)
    stop_time = Time.new
    minutes = stop_time.min - start_time.min
    seconds = stop_time.sec - start_time.sec
    puts "Congratulations! You guessed the sequence #{guess.upcase} in #{guess_count} guesses over #{minutes} minutes and #{seconds} seconds.
    Do you want to (p)lay again or (q)uit?"
  end
end
