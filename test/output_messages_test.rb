require 'minitest/autorun'
require 'minitest/pride'
require './lib/output_messages'
require 'pry'

class OutputMessagesTest < Minitest::Test
  def setup
    @messages = Object.new
    @messages.extend(OutputMessages)
  end

  def test_introduction_message
    assert_output "Welcome to MASTERMIND\n\n" do
      @messages.introduction
    end
  end

  def test_selection_message
    assert_output "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n" do
      @messages.selection
    end
  end
end
