module OutputMessages
  def self.introduction_output
    puts "Welcome to MASTERMIND\n\n"
  end

  def self.selection_output
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.instructions_output
    puts "\t\t\t[[MASTERMIND INSTRUCTIONS]]\n\n
    1. Guess the randomly generated set of colors(red, green, blue, yellow)\n
    \ta. This set is four characters in length
    \tb. The player has unlimited attempts to guess
    2. Guess the correct values and you win"
  end

  def self.quit
    exit
  end

  def self.start_output
    "I have generated a beginner sequence with four elements made up of: (r)ed,\n
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end
end
