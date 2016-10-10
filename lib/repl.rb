require './lib/output_messages'
require './lib/play'
require 'pry'
class Repl
  include OutputMessages
  def start_game
    get_welcome_messages
    choice = gets.chomp.downcase
    until choice == "q" || choice == "quit"
      if choice == "i" || choice == "instructions"
        OutputMessages.instructions
      elsif choice == "p" || choice == "play"
        Play.new
        OutputMessages.new_game
      else
        puts "invalid choice"
      end
      choice = gets.chomp.downcase
    end
    OutputMessages.quit
  end

  def get_welcome_messages
    OutputMessages.introduction
    OutputMessages.selection
  end
end

Repl.new.start_game
