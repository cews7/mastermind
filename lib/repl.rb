require './lib/output_messages'
class Repl
  include OutputMessages
  OutputMessages.introduction_output
  OutputMessages.selection_output
  choice = gets.chomp
  while choice != "q" || "quit"
    case choice
    when choice == "p" || "play"
      Play.new
    when choice == "i" || "instructions"
      OutputMessages.instructions_output
    else
      puts "invalid choice"
    end
    OutputMessages.quit
  end
end
