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
    (g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game."
  end

  def prompt_to_guess
    puts "Guess the secret code as many times as you'd like. Should you get bored, you can (c)heat."
    print "Enter guess: "
  end
end
